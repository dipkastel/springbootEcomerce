package com.notrika.controller.pages.customer;

import com.notrika.helper.CookieHelper;
import com.notrika.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/customer/wallet")
public class CustomerWalletController {

    private final CookieHelper cookieHelper;
    private final ProductService productService;

    @Autowired
    public CustomerWalletController(CookieHelper cookieHelper, ProductService productService) {
        this.cookieHelper = cookieHelper;
        this.productService = productService;
    }

    @GetMapping
    public String customerWalletPage(Authentication authentication, Model model, HttpServletRequest res){
        return  "template/user/page/customer/wallet/wallet-page";
    }
    
}
