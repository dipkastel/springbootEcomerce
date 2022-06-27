package com.notrika.controller;

import com.notrika.entity.tables.Customer;
import com.notrika.entity.tables.Menu;
import com.notrika.entity.tables.Message;
import com.notrika.entity.tables.User;
import com.notrika.helper.CookieHelper;
import com.notrika.helper.UserHelper;
import com.notrika.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.mvc.support.DefaultHandlerExceptionResolver;

import javax.annotation.security.RolesAllowed;
import javax.servlet.http.HttpServletRequest;
import java.util.*;


@ControllerAdvice
public class ControllerAdvisor  extends DefaultHandlerExceptionResolver  {


    private final UserService userService;
    private final UserHelper userHelper;
    private final MenuService menuService;
    private final CustomerService customerService;
    private final MessageService messageService;

    @Autowired
    public ControllerAdvisor(UserService userService,UserHelper userHelper,MenuService menuService,CustomerService customerService,MessageService messageService) {

        this.userService = userService;
        this.userHelper = userHelper;
        this.menuService = menuService;
        this.customerService = customerService;
        this.messageService= messageService;
    }


    @ModelAttribute(value = "user")
    public User user(Authentication authentication){
        return userHelper.getUser(authentication,userService);
    }

    @ModelAttribute("customer")
    public Customer costomer(Authentication authentication){
        return userHelper.getCustomer(authentication,customerService,userService);
    }

//    @ModelAttribute("categories")
//    public List<Category> categories(){
//        return  categoryService.findAll().stream().filter(p->p.getParentId()==null).collect(Collectors.toList());
//    }


//    @ModelAttribute("brands")
//    public List<Brand> brands(){
//        return  brandService.findAll();
//    }

    @ModelAttribute("menu")
    public List<Menu> brands(){
        return  menuService.findAll();
    }

    @ModelAttribute(value = "messages")
    public List<Message> Messages(Authentication authentication, HttpServletRequest request){
        User user =  userHelper.getUser(authentication,userService);
        if(user==null||!Objects.equals(user.getRole(), "ROLE_ADMIN")){
           String uuid =  CookieHelper.getUserUniqueCookie(request);
           return messageService.getMessagesOfUser(uuid);
        }else{
            return messageService.getUsersAndLastMessages();
        }
    }



//    @ModelAttribute("brandsByCategory")
//    public Map<String, Set<Brand>> filterBrandByCategory(){
//        Map<String, Set<Brand>> map = new HashMap<>();
//        categoryService.findAll().forEach(c->{
//            Set<Brand> brands = new HashSet<>();
////            productService.findByCategoriesContains(c.getId()).forEach(p->brands.add(p.getBrand()));
//            map.put(c.getName(),brands);
//        });
//        return map;
//    }

//    @ModelAttribute("typeByCategory")
//    public Map<String, Set<Type>> filterTypeByCategory(){
//        Map<String, Set<Type>> map = new HashMap<>();
//        categoryService.findAll().forEach(c->{
//            Set<Type> types = new HashSet<>();
//            typeService.findByCategoryId(c.getId()).forEach(t->types.add(t));
//            map.put(c.getName(),types);
//        });
//        return map;
//    }

//
//
//    @ModelAttribute("allProducts")
//    public List<Product> allProducts(){
//        return productService.findAllIgnoreStatus();
//    }
//
//
//    @ModelAttribute("topProducts")
//    public List<Product> topProducts(){
//        List<Product> list = new ArrayList<>();
//        productService.findTop5().forEach(pid->list.add(productService.findById(pid)));
//        return list;
//    }



//commit

}
