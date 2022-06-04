package com.notrika.controller.pages;

import com.notrika.entity.*;
import com.notrika.service.CategoryService;
import com.notrika.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Controller
@RequestMapping("/product")
public class PageProductController {
    private Long categoryId;
    private final ProductService productService;
    private final CategoryService categoryService;
    private static final Logger LOGGER = LoggerFactory.getLogger(PageProductController.class);

    @Autowired
    public PageProductController(ProductService productService, CategoryService categoryService) {
        this.productService = productService;
        this.categoryService = categoryService;
    }

    @GetMapping
    public String productHomePage(
            Authentication authentication,
            Model model,
            @RequestParam(name = "category", required = false) Long categoryId,
            @RequestParam(name = "brand", required = false) Long brandId,
            @RequestParam(name = "type", required = false) Long typeId
    ) {
        if (categoryId != null) {
            LOGGER.info("load by CategoryId (categoryId != null)");
            this.categoryId = categoryId;
            addModelAttribute(
                    productService.findByCategories(categoryId),
                    productService.findByCategories(categoryId).stream().count(),
                    categoryService.findById(categoryId),
                    model
            );
            if (typeId != null) {
                LOGGER.info("load by CategoryId and TypeId(categoryId != null,typeId != null)");
                addModelAttribute(
                        productService.findByCategoryIdAndTypeId(categoryId, typeId),
                        productService.findByCategoryIdAndTypeId(categoryId, typeId).stream().count(),
                        categoryService.findById(categoryId),
                        model
                );
            }
            if (brandId != null) {
                LOGGER.info("load by CategoryId and BrandId (categoryId != null, brandId != null)");
                addModelAttribute(
                        productService.findByCategoriesContainsAndBrandId(categoryId, brandId),
                        productService.findByCategoriesContainsAndBrandId(categoryId, brandId).stream().count(),
                        categoryService.findById(categoryId),
                        model
                );
            }


        }else {

                LOGGER.info("load by  (categoryId == null)");
                //all null
                model.addAttribute("products", productService.findAll());
                model.addAttribute("countProduct", productService.findAll().stream().count());
                Set<Brand> brandByProduct = new HashSet<>();
                Set<String> typeByProduct = new HashSet<>();
                productService.findAll().forEach(p -> {
                    brandByProduct.add(p.getBrand());
                    typeByProduct.add(p.getType());
                });
                model.addAttribute("brandByProduct", brandByProduct);
                model.addAttribute("typeByProduct", typeByProduct);


        }
        model.addAttribute("allProducts", productService.findAll());
        LOGGER.info("return");
        return "template/user/page/product/shop-by-category";
    }

    @PostMapping
    public String processSearch(
            @RequestParam(name = "category", required = false) Long categoryId,
            @RequestParam(name = "keyword", required = false) String keyword,
            Model model){
        if (categoryId!=null){
                LOGGER.info("load by CategoryId and Keyword (categoryId != null, Keyword != null)");
                addModelAttribute(
                        productService.findProductContainsByCategoryId(keyword, categoryId),
                        productService.findProductContainsByCategoryId(keyword, categoryId).stream().count(),
                        categoryService.findById(categoryId),
                        model
                );
        }else{
            LOGGER.info("load by  (categoryId == null , keyword !=null)");
            model.addAttribute("products",productService.findProductContains(keyword));
            model.addAttribute("countProduct",productService.findProductContains(keyword).stream().count());
            Set<Brand> brandByProduct = new HashSet<>();
            Set<String> typeByProduct = new HashSet<>();
            productService.findAll().forEach(p -> {
                brandByProduct.add(p.getBrand());
                typeByProduct.add(p.getType());
            });
            model.addAttribute("brandByProduct", brandByProduct);
            model.addAttribute("typeByProduct", typeByProduct);
        }
        return "template/user/page/product/shop-by-category";

    }

    public Long getCategoryId() {
        return this.categoryId;
    }

    public void addModelAttribute(List<Product> productList,Long countProduct,Category categoryByProduct,Model model){
        model.addAttribute("products", productList);
        model.addAttribute("countProduct", countProduct);
        model.addAttribute("categoryByProduct",categoryByProduct);
    }

}
