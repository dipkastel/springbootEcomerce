package com.notrika.controller.pages.customer;

import com.notrika.entity.tables.Customer;
import com.notrika.entity.tables.User;
import com.notrika.helper.UserHelper;
import com.notrika.service.CustomerService;
import com.notrika.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/customer/info")
public class CustomerInfoController {

    private final CustomerService customerService;
    private final UserService userService;
    private final UserHelper userHelper;
    @Autowired
    public CustomerInfoController(CustomerService customer,UserService userService,UserHelper userHelper) {
        this.customerService = customer;
        this.userService = userService;
        this.userHelper = userHelper;
    }

    @GetMapping
    public String customerInfoPage(Authentication authentication, Model model) {
//        UserDetail userDetails = (UserDetail) authentication.getPrincipal();
//        model.addAttribute("user", userDetails.getUser());
        User user = userHelper.getUser(authentication,userService);
//        if (authentication.getPrincipal() instanceof  UserDetail){
//            UserDetail userDetails = (UserDetail) authentication.getPrincipal();
//            user = userDetails.getUser();
//        }
//
//        if (authentication.getPrincipal() instanceof OAuth2User) {
//            OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();
//            user = userService.findByEmail(String.valueOf(oAuth2User.getAttributes().get("email")));
//        }


        Long countCustomer = customerService.countByUserId(user.getId());

        if (countCustomer>0){
            Customer customer = customerService.findByUserId(user.getId());
            model.addAttribute("customerInfo",customer);
            return "template/user/page/customer/info/info-page";
        }else{
            model.addAttribute("customerInfo",new Customer());
            return "template/user/page/customer/info/info-new";
        }

    }

    @GetMapping("/update")
    public String processCustomerInfo(Model model,@RequestParam("id")Long id){
        model.addAttribute("customerInfo",customerService.findById(id));
        return "template/user/page/customer/info/info-update";
    }


    @PostMapping("/update")
    public String updateCustomerInfo(Customer customer, HttpServletRequest request){
        customerService.save(customer);
        String message = (String) request.getSession().getAttribute("message");
        request.getSession().setAttribute("message", "Update success !");
        return "redirect:/customer/info";
    }


    @PostMapping("/new")
    public String createCustomerInfo(Customer customer, HttpServletRequest request,Authentication authentication){
        User user = userHelper.getUser(authentication,userService);
//        if (authentication.getPrincipal() instanceof  UserDetail){
//            UserDetail userDetails = (UserDetail) authentication.getPrincipal();
//            user = userDetails.getUser();
//        }
//
//        if (authentication.getPrincipal() instanceof OAuth2User) {
//            OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();
//            user = userService.findByEmail(String.valueOf(oAuth2User.getAttributes().get("email")));
//        }
//        UserDetail userDetails = (UserDetail) authentication.getPrincipal();
        Long countCustomer = customerService.countByUserId(user.getId());
        if (countCustomer == 0){
            customer.setUser(user);
            customerService.save(customer);
            String message = (String) request.getSession().getAttribute("message");
            request.getSession().setAttribute("message", "Submit success !");
        }
        return "redirect:/customer/info";
    }

}
