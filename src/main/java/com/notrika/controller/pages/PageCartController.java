package com.notrika.controller.pages;

import com.notrika.entity.*;
import com.notrika.entity.tables.CartItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
@RequestMapping("/cart")
public class PageCartController {

    private final Cart cart;

    @Autowired
    public PageCartController(Cart cart) {
        this.cart = cart;
    }

    @GetMapping
    public String cartPage(Authentication authentication, Model model){
//        if (authentication!=null){
//            UserDetail userDetails = (UserDetail) authentication.getPrincipal();
//            model.addAttribute("user",userDetails.getUser());
//        }

        List<CartItem> cartItems = cart.getCartItems();
        if (cartItems.size()>0){
            model.addAttribute("cartItems",cartItems);
            model.addAttribute("total",cart.calCartTotal());
        }
        return "template/user/page/product/cart";

    }

}
