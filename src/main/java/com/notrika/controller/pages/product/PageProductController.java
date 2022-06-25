package com.notrika.controller.pages.product;

import com.notrika.entity.tables.*;
import com.notrika.helper.UserHelper;
import com.notrika.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.*;


@Controller
@RequestMapping("/product")
public class PageProductController {
    private static final Logger log = LoggerFactory.getLogger(PageProductController.class);
    private Long categoryId;
    private final ProductService productService;
    private final CategoryService categoryService;
    private final CustomerService customerService;
    private final UserService userService;
    private final UserHelper userHelper;
    private final RatingService ratingService;


    @Autowired
    public PageProductController(CategoryService categoryService,ProductService productService, CustomerService customerService, UserService userService,
                                 UserHelper userHelper, RatingService ratingService) {
        this.productService = productService;
        this.categoryService = categoryService;
        this.customerService = customerService;
        this.userHelper = userHelper;
        this.userService = userService;
        this.ratingService = ratingService;
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
            log.info("load by CategoryId (categoryId != null)");
            this.categoryId = categoryId;
            addModelAttribute(
                    productService.findByCategoryId(categoryId),
                    productService.findByCategoryId(categoryId).stream().count(),
                    categoryService.findById(categoryId),
                    model
            );
            if (typeId != null) {
                log.info("load by CategoryId and TypeId(categoryId != null,typeId != null)");
                addModelAttribute(
                        productService.findByCategoryIdAndTypeId(categoryId, typeId),
                        productService.findByCategoryIdAndTypeId(categoryId, typeId).stream().count(),
                        categoryService.findById(categoryId),
                        model
                );
            }
            if (brandId != null) {
                log.info("load by CategoryId and BrandId (categoryId != null, brandId != null)");
                addModelAttribute(
                        productService.findByCategoriesContainsAndBrandId(categoryId, brandId),
                        productService.findByCategoriesContainsAndBrandId(categoryId, brandId).stream().count(),
                        categoryService.findById(categoryId),
                        model
                );
            }


        }else {

            log.info("load by  (categoryId == null)");
                //all null
                model.addAttribute("products", productService.findByPagination(1,50));
                model.addAttribute("countProduct", productService.productCounts());
        }
        return "template/user/page/product/products-filter";
    }

    @PostMapping
    public String processSearch(
            @RequestParam(name = "category", required = false) Long categoryId,
            @RequestParam(name = "keyword", required = false) String keyword,
            Model model){
        if (categoryId!=null){
            log.info("load by CategoryId and Keyword (categoryId != null, Keyword != null)");
                addModelAttribute(
                        productService.findProductContainsByCategoryId(keyword, categoryId),
                        productService.findProductContainsByCategoryId(keyword, categoryId).stream().count(),
                        categoryService.findById(categoryId),
                        model
                );
        }else{
            log.info("load by  (categoryId == null , keyword !=null)");
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


    public void addModelAttribute(List<Product> productList, Long countProduct, Category categoryByProduct, Model model){
        model.addAttribute("products", productList);
        model.addAttribute("countProduct", countProduct);
        model.addAttribute("categoryByProduct",categoryByProduct);
    }

    @GetMapping( {"/{id}","/{id}/{islug}"})
    public String view(@PathVariable("id") String iid, @PathVariable(value = "slug" ,required = false) String islug, Authentication authentication, Locale locale, Model model,
                       HttpServletRequest res) {
        log.info("product detail {}.", locale);
        // Review
        Long id = Long.parseLong(iid.split("-")[1]);
        if (authentication != null) {
            User user = userHelper.getUser(authentication, userService);
            model.addAttribute("user", user);
            Customer customer = customerService.findByUserId(user.getId());
            if (customer != null) {
                Rating r = ratingService.findByCustomerIdAndProductId(customer.getId(), id);
                model.addAttribute("rating", r);
            }
        }
        Double avgStar = ratingService.avgStarByProductId(id);
        Integer numberReview = ratingService.countReviewByProductId(id);
        model.addAttribute("avgStar", avgStar);
        model.addAttribute("numberReview", numberReview);
        for (int i = 1; i <= 5; i++) {
            model.addAttribute("star" + i, ratingService.percentOfStar(id, i));
            model.addAttribute("nReview" + i, ratingService.countReviewByProductIdAndStarNumber(id, i));
        }
        //product
        Product p = productService.findById(id);
        model.addAttribute("product", p);
//		String[] listColor = p.getProductColor().split(",");
//		for (String color : listColor) {
//			model.addAttribute(color, color);
//		}

//		List<Product> listProductByCategory = productService.findByCategories(p.getCategories().stream().findFirst().get().getId());
//		model.addAttribute("listProductByCategory", listProductByCategory);
//		model.addAttribute("allProducts", productService.findAll());
        // review
//		Map<Long, Integer> mapReviewByCategory = ratingService.findAllReviewByList(listProductByCategory);
//		model.addAttribute("mapReviewByCategory", mapReviewByCategory);
//		Map<Long, Double> mapAvgStarByCategory = ratingService.findAllAvgStarByList(listProductByCategory);
//		model.addAttribute("mapAvgStarByCategory", mapAvgStarByCategory);


        Cookie[] cl = res.getCookies();
        List<Product> viewlist = new ArrayList<Product>();
        if (cl != null) {
            for (Cookie o : cl) {
                if (o.getName().equals("viewlist")) {
                    if (!o.getValue().isEmpty()) {
                        String[] txt = o.getValue().split("a");
                        for (String s : txt) {
                            viewlist.add(productService.findById(Long.parseLong(s)));
                        }
                    }
                }
            }
        }
        model.addAttribute("viewlist", viewlist);
        // review
        Map<Long, Integer> mapReviewByView = ratingService.findAllReviewByList(viewlist);
        model.addAttribute("mapReviewByView", mapReviewByView);
        Map<Long, Double> mapAvgStarByView = ratingService.findAllAvgStarByList(viewlist);
        model.addAttribute("mapAvgStarByView", mapAvgStarByView);
        return "template/user/page/productDetail/product-detail";
    }

    @PostMapping("/review")
    public String review(User user, Product product, Rating rating, Model model, HttpServletRequest request) {
        log.info("review");
        if (user != null) {
            if (user.getRole().equals("ROLE_USER")) {
                Customer customer = customerService.findByUserId(user.getId());
                if (customer != null) {
                    Rating ratingExists = ratingService.findByCustomerIdAndProductId(customer.getId(), product.getId());
                    if (ratingExists != null) {
                        ratingExists.setReview(rating.getReview());
                        ratingExists.setStarNumber(rating.getStarNumber());
                        ratingService.save(ratingExists);
                    } else {
                        Rating r = new Rating();
                        r.setCustomer(customer);
                        r.setProduct(product);
                        r.setReview(rating.getReview());
                        r.setStarNumber(rating.getStarNumber());
                        ratingService.save(r);
                    }
                    request.getSession().setAttribute("message", "review sucessful!");
                    return "redirect:/product/detail?id=" + product.getId();
                } else {
                    request.getSession().setAttribute("message", "invalid, please enter your information!");
                    return "redirect:/customer/info";
                }
            } else {
                request.getSession().setAttribute("message", "invalid, admin has no rights!");
                return "redirect:/product/detail?id=" + product.getId();
            }
        }
        request.getSession().setAttribute("message", "invalid, please login!");
        return "redirect:/register";
    }



}
