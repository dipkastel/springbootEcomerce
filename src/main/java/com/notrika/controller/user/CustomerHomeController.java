package com.notrika.controller.user;

import com.notrika.entity.Cart;
import com.notrika.entity.Product;
import com.notrika.helper.CookieHelper;

import com.notrika.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * author TranDung
 * */
@Controller
@RequestMapping("/customer")
public class CustomerHomeController {
	
    private final Cart cart;
    private final CookieHelper cookieHelper;
    private final ProductService productService;
    @Autowired
    public CustomerHomeController(Cart cart,CookieHelper cookieHelper, ProductService productService) {
        this.cart = cart;
        this.cookieHelper = cookieHelper;
        this.productService = productService;
    }

    @GetMapping
    public String customerHomePage(Authentication authentication, Model model, HttpServletRequest res){
//        UserDetail userDetails = (UserDetail) authentication.getPrincipal();
//        model.addAttribute("user",userDetails.getUser());
        List<Product> viewList = cookieHelper.getCookieByName(res,productService,"viewlist");

        if (cart.getCartItems().size()>0){
             return "redirect:/customer/product/checkout-page";
        }

        if (viewList.size()>0){
            return "redirect:/customer/recent";
        }

        return  "redirect:/customer/info";
    }
    
}
