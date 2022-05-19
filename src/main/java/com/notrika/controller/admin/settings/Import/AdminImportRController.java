package com.notrika.controller.admin.settings.Import;

import com.notrika.entity.ProductImportProgress;
import com.notrika.helper.Wp;
import com.notrika.service.CategoryService;
import com.notrika.service.ProductService;
import com.notrika.service.TagService;
import com.notrika.service.WebsiteManagerService;
import com.notrika.wpRestApi.WpRestApi;
import com.notrika.wpRestApi.entities.Tag.Tag;
import com.notrika.wpRestApi.entities.category.Category;
import com.notrika.wpRestApi.entities.product.Product;
import com.notrika.wpRestApi.entities.systemStatus.SystemStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;


@RestController
@RequestMapping(path = "/admin/import", produces = "application/json", headers = "Accept=*/*")
@CrossOrigin(origins = "*")
public class AdminImportRController {

    @Autowired
    private Wp wp;
    @Autowired
    private ProductService productService;
    @Autowired
    private TagService tagService;
    @Autowired
    private CategoryService categoryService;

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

        wp.reInitialization();
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
    public void importProductAll() {

        executor.execute(() -> {
            List<Product> allProducts = getProducts();
            List<com.notrika.entity.Product> myProduct = convertProducts(allProducts);
            insertProduct(myProduct);
        });
    }

    @GetMapping("/products/deleteAll")
    public void DeleteAllProducts() {
        executor.execute(() -> {
            websiteManagerService.ClearProducts();
        });
    }

    @GetMapping("/tags/all")
    public boolean importAllTags() {
        com.notrika.wpRestApi.entities.Tag.Tag[] tags = new Tag[0];
        List<com.notrika.wpRestApi.entities.Tag.Tag> allTags = new ArrayList();

        progress = new ProductImportProgress();
        progress.setOpration("دریافت تگ ها ");
        int page = 1;
        int per_page = 99;
        do {
            try {
                tags = wpRestApi.tag.getAll(page, per_page);
                allTags.addAll(Arrays.stream(tags).collect(Collectors.toList()));
                page++;
                progress.setProductCount(allTags.size());
            } catch (Exception e) {
                tags = new Tag[4];
            }
        } while (!(tags.length <= 0));

        progress.setOpration("تغییر فرمت ");


        List<com.notrika.entity.Tag> myTags = allTags.stream().map(p -> {
            com.notrika.entity.Tag tag = new com.notrika.entity.Tag();
            tag.setId(p.id);
            tag.setTagName(p.name);
            tag.setSlug(p.slug);
            tag.setDescription(p.description);
            tag.setMasterTag(false);
            return tag;
        }).collect(Collectors.toList());


        progress.setOpration("ثبت در پایگاه");
        final int[] count = {0};
        myTags.forEach(t->{
            tagService.save(t);
            count[0]++;
            progress.setProductCount(count[0]);
        });
        return true;

    }
    @GetMapping("/category/all")
    public boolean importAllCategories() {
        com.notrika.wpRestApi.entities.category.Category[] cats = new Category[0];
        List<com.notrika.wpRestApi.entities.category.Category> allcats = new ArrayList();

        progress = new ProductImportProgress();
        progress.setOpration("دریافت دسته بتدی ها ");
        int page = 1;
        int per_page = 99;
        do {
            try {
                cats = wpRestApi.category.getAll(page, per_page);
                allcats.addAll(Arrays.stream(cats).collect(Collectors.toList()));
                page++;
                progress.setProductCount(allcats.size());
            } catch (Exception e) {
                cats = new Category[4];
            }
        } while (!(cats.length <= 0));

        progress.setOpration("تغییر فرمت ");


        List<com.notrika.entity.Category> mycats =getcats(allcats,0l);


        progress.setOpration("ثبت در پایگاه");
        final int[] count = {0};
        mycats.forEach(t->{
            categoryService.save(t);
            count[0]++;
            progress.setProductCount(count[0]);
        });
        return true;

    }

    private List<com.notrika.entity.Category> getcats(List<Category> allcats,Long parent) {
        return  allcats.stream().filter(c->Long.valueOf(c.parent).equals(parent)).map(p -> {
            com.notrika.entity.Category cat = new com.notrika.entity.Category();
            cat.setId(p.id);
            cat.setName(p.name);
            cat.setSlug(p.slug);
            cat.setDescription(p.description);
            cat.setDisplay(p.display);
            cat.setMenuOrder(p.menuOrder);
            cat.setSubCategories(getcats(allcats,p.id));
            return cat;
        }).collect(Collectors.toList());
    }

    private void insertProduct(List<com.notrika.entity.Product> myProduct) {
        progress = new ProductImportProgress();
        progress.setOpration("ذخیره محصولات");
        int count = 0;
        for (com.notrika.entity.Product product : myProduct) {
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
        List<com.notrika.entity.Product> products = allProducts.stream().map(p -> {
            com.notrika.entity.Product myProduct = new com.notrika.entity.Product();
            myProduct.setName(p.name);
            myProduct.setStockQuantity((p.stockQuantity != null) ? p.stockQuantity : 0);
//            myProduct.setPrice(p.price);
            count.getAndIncrement();
            progress.setProductCount(count.get());
            return myProduct;
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
