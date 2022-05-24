package com.notrika.controller.admin.settings.Import;

import com.notrika.entity.*;
import com.notrika.helper.Wp;
import com.notrika.service.*;
import com.notrika.wpRestApi.WpRestApi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
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
    private Wp wp;
    @Autowired
    private ProductService productService;
    @Autowired
    private TagService tagService;
    @Autowired
    private BrandService brandService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ImageService imageService;

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
    public com.notrika.wpRestApi.entities.systemStatus.SystemStatus EditUserController(Model model, Authentication authentication) {

        wp.reInitialization();
        com.notrika.wpRestApi.entities.systemStatus.SystemStatus systemStatus = wpRestApi.system.getSystemStatus();

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
            List<com.notrika.wpRestApi.entities.product.Product> allProducts = getProducts();
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
        com.notrika.wpRestApi.entities.Tag.Tag[] tags = new com.notrika.wpRestApi.entities.Tag.Tag[0];
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
                tags = new com.notrika.wpRestApi.entities.Tag.Tag[4];
            }
        } while (!(tags.length <= 0));

        progress.setOpration("تغییر فرمت ");


        List<com.notrika.entity.Tag> myTags = allTags.stream().map(p -> {
            com.notrika.entity.Tag tag = new com.notrika.entity.Tag();
            tag.setId(p.id);
            tag.setName(p.name);
            tag.setSlug(p.slug);
            tag.setDescription(p.description);
            tag.setMasterTag(false);
            return tag;
        }).collect(Collectors.toList());


        progress.setOpration("ثبت در پایگاه");
        final int[] count = {0};
        myTags.forEach(t -> {
            tagService.save(t);
            count[0]++;
            progress.setProductCount(count[0]);
        });
        return true;

    }

    @GetMapping("/category/all")
    public boolean importAllCategories() {
        com.notrika.wpRestApi.entities.category.Category[] cats = new com.notrika.wpRestApi.entities.category.Category[0];
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
                cats = new com.notrika.wpRestApi.entities.category.Category[4];
            }
        } while (!(cats.length <= 0));

        progress.setOpration("تغییر فرمت ");


        List<com.notrika.entity.Category> mycats = getcats(allcats, 0l);


        progress.setOpration("ثبت در پایگاه");
        final int[] count = {0};
        mycats.forEach(t -> {
            categoryService.save(t);
            count[0]++;
            progress.setProductCount(count[0]);
        });
        return true;

    }

    //recursive
    private List<com.notrika.entity.Category> getcats(List<com.notrika.wpRestApi.entities.category.Category> allcats, Long parent) {
        return allcats.stream().filter(c -> Long.valueOf(c.parent).equals(parent)).map(p -> {
            com.notrika.entity.Category cat = new com.notrika.entity.Category();
            cat.setId(p.id);
            cat.setName(p.name);
            cat.setSlug(p.slug);
            cat.setDescription(p.description);
            cat.setDisplay(p.display);
            cat.setMenuOrder(p.menuOrder);
            cat.setSubCategories(getcats(allcats, p.id));
            return cat;
        }).collect(Collectors.toList());
    }


    private void convertAndInsertProducts(List<com.notrika.wpRestApi.entities.product.Product> allProducts, AtomicInteger count) {
        progress = new ProductImportProgress();
        progress.setOpration("تغییر محصولات به فرمت سایت ");
        allProducts.forEach(p -> {
            try {
                com.notrika.entity.Product myProduct = new com.notrika.entity.Product();
                myProduct.setName(p.name);
                myProduct.setSlug(p.slug);
                myProduct.setType(p.type);
                myProduct.setStatus(p.status);
                myProduct.setFeatured(p.featured);
                myProduct.setCatalogVisibility(p.catalogVisibility);
                myProduct.setDescription(p.description);
                myProduct.setShortDescription(p.shortDescription);
                myProduct.setSku(p.sku);
                try {
                    myProduct.setPrice(Double.valueOf(p.price));
                } catch (Exception e) {
                    myProduct.setPrice(0d);
                }
                try {
                    myProduct.setRegularPrice(Double.valueOf(p.regularPrice));
                } catch (Exception e) {
                    myProduct.setRegularPrice(0d);
                }
                try {
                    myProduct.setSalePrice(Double.valueOf(p.salePrice));
                } catch (Exception e) {
                    myProduct.setSalePrice(0d);
                }
                myProduct.setPurchasable(p.purchasable);
                myProduct.setOnSale(p.onSale);
                myProduct.setStockQuantity((p.stockQuantity != null) ? p.stockQuantity : 0);
                myProduct.setWeight(p.weight);
                myProduct.setSoldIndividually(p.soldIndividually);
                myProduct.setAverageRating(p.averageRating);
                myProduct.setRatingCount(p.ratingCount);
                myProduct.setStockStatus(p.stockStatus);
                myProduct.setReviewsAllowed(p.reviewsAllowed);
                //brand
                try {
                    if(p.brands.size()>0){
                        com.notrika.wpRestApi.entities.product.Brand wpbrand = p.brands.get(0);
                        Brand brand = brandService.findByName(wpbrand.name);
                        if (brand == null) {
                            Brand brand1 = new Brand();
                            brand1.setName(wpbrand.name);
                            brand1.setSlug(wpbrand.slug);
                            brandService.save(brand1);
                            brand = brandService.findByName(wpbrand.name);
                        }
                        myProduct.setBrand(brand);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                //category
                try {
                    List<com.notrika.wpRestApi.entities.product.Category> wpcats = p.categories;
                    List<Category> cats = new ArrayList<>();
                    for (com.notrika.wpRestApi.entities.product.Category cat : wpcats) {
                        Category myCat = categoryService.findByName(cat.name);
                        myProduct.categories.add(myCat);
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }

                //productAttribute
                try {

                    for (com.notrika.wpRestApi.entities.product.Attribute attr : p.attributes) {
                        if(attr.options.size()>0){
                            productAttribute myAttr = new productAttribute();
                            myAttr.name = attr.name;
                            myAttr.option = "";
                            attr.options.forEach(a -> {
                                myAttr.option += a + ",";
                            });
                            myProduct.attributes.add(myAttr);
                        }
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
                //tags
                try {
                    List<com.notrika.wpRestApi.entities.Tag.Tag> wptags = p.tags;
                    Set<Tag> tagSet =new  HashSet();
                    wptags.forEach(t -> {
                            Tag mytag = new Tag();
                            mytag.setName(t.name);
                            mytag.setSlug(t.slug);
                            mytag.setDescription(t.description);
                            mytag.setMasterTag(false);
                        tagSet.add(mytag);
                    });
                    myProduct.setTags(tagSet);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                //images
                List<ImageGallery> images = new ArrayList<>();
                p.images.forEach(i -> {
                    InputStream is = null;
                    try {
                        URL url = new URL(i.src);
                        ByteArrayOutputStream baos = new ByteArrayOutputStream();
                        is = url.openStream();
                        byte[] byteChunk = new byte[4096]; // Or whatever size you want to read in at a time.
                        int n;

                        while ((n = is.read(byteChunk)) > 0) {
                            baos.write(byteChunk, 0, n);
                        }

                        ImageGallery imageGallery = new ImageGallery();
                        imageGallery.setImage(baos.toByteArray());
                        images.add(imageGallery);
                    } catch (IOException e) {
                        e.printStackTrace();
                    } finally {
                        if (is != null) {
                            try {
                                is.close();
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                });
                myProduct.setImages(images);
                productService.save(myProduct);
                count.getAndIncrement();
                progress.setProductCount(count.get());
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }

    private List<com.notrika.wpRestApi.entities.product.Product> getProducts() {

        AtomicInteger count = new AtomicInteger();
        com.notrika.wpRestApi.entities.product.Product[] wpproducts;
        List<com.notrika.wpRestApi.entities.product.Product> allWpProducts = new ArrayList<>();
        int page = 1;
        int per_page = 5;
        progress = new ProductImportProgress();
        progress.setOpration(wpRestApi.wpRestApiConfigService.getSiteUrl() + "دریافت محصولات از سایت ");

        do {
            try {
                wpproducts = wpRestApi.product.getAll(page, per_page);
                allWpProducts.addAll(Arrays.stream(wpproducts).collect(Collectors.toList()));
                progress.setProductCount(allWpProducts.size());
                if (wpproducts.length <= 0) {
                    progress.setComplete(true);
                } else {
                    try {

                        convertAndInsertProducts(Arrays.stream(wpproducts).collect(Collectors.toList()),count);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                page++;
            } catch (Exception e) {
                e.printStackTrace();

            }
        } while (!progress.isComplete());
        return allWpProducts;
    }
}
