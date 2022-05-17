package com.notrika.controller.admin.settings.Import;

import com.notrika.entity.ProductImportProgress;
import com.notrika.service.ProductService;
import com.notrika.service.WebsiteManagerService;
import com.notrika.wpRestApi.WpRestApi;
import com.notrika.wpRestApi.entities.product.Product;
import com.notrika.wpRestApi.entities.systemStatus.SystemStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;


@RestController
@RequestMapping(path = "/admin/import", produces = "application/json", headers = "Accept=*/*")
@CrossOrigin(origins = "*")
public class AdminImportRController {

	@Autowired
	private ProductService productService;

	@Autowired
	private WebsiteManagerService websiteManagerService;

    private WpRestApi wpRestApi;

    private ExecutorService executor
            = Executors.newCachedThreadPool();

    private ExecutorService nonBlockingService = Executors
            .newCachedThreadPool();
    ProductImportProgress progress = new ProductImportProgress();


    @Autowired
    public AdminImportRController(WpRestApi _wpRestApi) {
        this.wpRestApi = _wpRestApi;
    }

    @GetMapping("/TestConnection")
    public SystemStatus EditUserController(Model model, Authentication authentication) {
        SystemStatus systemStatus = wpRestApi.system.getSystemStatus();

        return systemStatus;
    }


    @GetMapping("/progress")
    public SseEmitter handleSse() {

        SseEmitter emitter = new SseEmitter();
        nonBlockingService.execute(() -> {
            try {
                emitter.send(progress);
            } catch (Exception ex) {
                emitter.completeWithError(ex);
            }
        });
        return emitter;
    }

    @GetMapping("/products/all")
    public void importProductAll(@RequestParam(name = "deleteAll", required = false) boolean deleteAll) {

        executor.execute(() -> {
        	if(deleteAll)
                websiteManagerService.ClearProducts();
            List<Product> allProducts = getProducts();
            List<com.notrika.entity.Product> myProduct = convertProducts(allProducts);
            insertProduct(myProduct);
        });
    }

	private void insertProduct(List<com.notrika.entity.Product> myProduct) {
		progress = new ProductImportProgress();
		progress.setOpration("ذخیره محصولات");
		int count = 0;
		for (com.notrika.entity.Product product :myProduct) {
			productService.save(product);
			count++;
			progress.setProductCount(count);
		}
		progress.setComplete(true);
	}

	private List<com.notrika.entity.Product> convertProducts(List<Product> allProducts) {
		AtomicInteger count = new AtomicInteger();
		progress = new ProductImportProgress();
		progress.setOpration("تغییر محصولات به فرمت سایت ");
        List<com.notrika.entity.Product> products = allProducts.stream().map(p ->{
			com.notrika.entity.Product myProduct =new com.notrika.entity.Product();
			myProduct.setProductName(p.name);
			myProduct.setStockQuantity((p.stockQuantity!=null)?p.stockQuantity:0);
			myProduct.setEnabled(p.onSale);
			myProduct.setPrice(p.totalSales);
        	count.getAndIncrement();
        	progress.setProductCount(count.get());
        return 	myProduct;
        }).collect(Collectors.toList());
        progress.setComplete(true);
        return products;
    }

    private List<Product> getProducts() {

        Product[] products;
        List<Product> allProducts = new ArrayList<Product>();
        int page = 1;
        int per_page = 99;
        progress = new ProductImportProgress();
        progress.setOpration(wpRestApi.wpRestApiConfigService.getSiteUrl() + "دریافت محصولات از سایت ");

        do {
            try {
                products = wpRestApi.product.getAll(page, per_page);
                allProducts.addAll(Arrays.stream(products).collect(Collectors.toList()));
                progress.setProductCount(allProducts.size());
                if (products.length <= 0) {
                    progress.setComplete(true);
                }
                page++;
            } catch (Exception e) {


            }
        } while (!progress.isComplete());
        return allProducts;
    }
}
