package com.notrika.controller;

import com.notrika.entity.*;
import com.notrika.helper.UserHelper;
import com.notrika.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.mvc.support.DefaultHandlerExceptionResolver;

import java.util.*;
import java.util.stream.Collectors;


@ControllerAdvice
public class ControllerAdvisor  extends DefaultHandlerExceptionResolver  {


    private final CategoryService categoryService;
    private final BrandService brandService;
    private final ProductService productService;
    private final TypeService typeService;
    private final UserService userService;
    private final UserHelper userHelper;

    @Autowired
    public ControllerAdvisor(CategoryService categoryService, BrandService brandService, ProductService productService, TypeService typeService,UserService userService,UserHelper userHelper) {
        this.categoryService = categoryService;
        this.brandService = brandService;
        this.productService = productService;
        this.typeService = typeService;
        this.userService = userService;
        this.userHelper = userHelper;
    }


    @ModelAttribute("user")
    public User user(Authentication authentication){
        return userHelper.getUser(authentication,userService);
    }

    @ModelAttribute("categories")
    public List<Category> categories(){
        return  categoryService.findAll().stream().filter(p->p.getParentId()==null).collect(Collectors.toList());
    }


    @ModelAttribute("brands")
    public List<Brand> brands(){
        return  brandService.findAll();
    }



    @ModelAttribute("brandsByCategory")
    public Map<String, Set<Brand>> filterBrandByCategory(){
        Map<String, Set<Brand>> map = new HashMap<>();
        categoryService.findAll().forEach(c->{
            Set<Brand> brands = new HashSet<>();
            productService.findByCategoryId(c.getId()).forEach(p->brands.add(p.getBrand()));
            map.put(c.getName(),brands);
        });
        return map;
    }

    @ModelAttribute("typeByCategory")
    public Map<String, Set<Type>> filterTypeByCategory(){
        Map<String, Set<Type>> map = new HashMap<>();
        categoryService.findAll().forEach(c->{
            Set<Type> types = new HashSet<>();
            typeService.findByCategoryId(c.getId()).forEach(t->types.add(t));
            map.put(c.getName(),types);
        });
        return map;
    }



    @ModelAttribute("allProducts")
    public List<Product> allProducts(){
        return productService.findAllIgnoreStatus();
    }


    @ModelAttribute("topProducts")
    public List<Product> topProducts(){
        List<Product> list = new ArrayList<>();
        productService.findTop5().forEach(pid->list.add(productService.findById(pid)));
        return list;
    }



//commit

}
