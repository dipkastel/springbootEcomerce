package com.notrika.controller.pages.customer;

import com.notrika.entity.*;
import com.notrika.entity.tables.CartItem;
import com.notrika.entity.tables.Customer;
import com.notrika.entity.tables.CustomerOrder;
import com.notrika.entity.tables.User;
import com.notrika.helper.UserHelper;
import com.notrika.service.CustomerOrderService;
import com.notrika.service.CustomerService;
import com.notrika.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;


@Slf4j
@Controller
@RequestMapping("/customer")
public class CustomerCheckoutController {
    private Customer customer;
    private final CustomerService customerService;
    private final CustomerOrderService customerOrderService;
    private final Cart cart;
    private final UserService userService;
    private final UserHelper userHelper;

    @Autowired
    public CustomerCheckoutController(CustomerService customerService, Cart cart, CustomerOrderService customerOrderService,UserService userService,UserHelper userHelper) {
        this.customerService = customerService;
        this.cart = cart;
        this.customerOrderService = customerOrderService;
        this.userService=userService;
        this.userHelper=userHelper;
    }

//    @GetMapping
//    public String test(){
//        return "template/user/customer/product/checkout";
//    }

    @GetMapping("/checkout-page")
    public String checkoutPage(Authentication authentication, Model model){
//      check out page
        List<CartItem> cartItems = cart.getCartItems();
        if (cartItems.size()>0){
            model.addAttribute("cartItems",cartItems);
            model.addAttribute("total",cart.calCartTotal());
        }
//        order page

        User user = userHelper.getUser(authentication,userService);
        Customer customer = customerService.findByUserId(user.getId());
        List<CustomerOrder> orders;

        try{
            orders =  customerOrderService.findAllOrderByCustomerId(customer.getId());
        }catch (Exception e){
            orders = new ArrayList<>();
        }

        model.addAttribute("customerOrders",orders );
        return "template/user/page/customer/checkoutPage/checkout-page";
    }

//    @GetMapping("/checkout")
//    public String customerCheckoutProductPage(Authentication authentication, Model model) {
//        String template = "redirect:/customer/info";
//        log.info("set template customer info");
//        User user = userHelper.getUser(authentication,userService);
//            Long countCustomer = customerService.countByUserId(user.getId());
//
//            if (countCustomer > 0) {
//                log.info("customer already input info");
//                customer = customerService.findByUserId(user.getId());
//                if (customer.getAddress() != null && customer.getFirstName() != null && customer.getLastName() != null && customer.getPhone() != null) {
//                    log.info("customer already input all field of info");
//                    List<CartItem> listItem = new ArrayList<>(cart.getCartItems());
//                    model.addAttribute("customerOrder", new CustomerOrder(
//                            customer.getFirstName() + " " + customer.getLastName(),
//                            customer.getAddress(),
//                            customer.getPhone(),
//                            cart.calCartTotal(),
//                            false,
//                            customer,
//                            listItem
//                    ));
//                    log.info("set template checkout");
//                    template = "template/user/customer/product/checkout";
//                }
//            }
//
//        log.info("return teamplate");
//        return template;
//    }

    @PostMapping("/checkout")
    public String processCustomerOrder(Authentication authentication, CustomerOrder order, Model model) {
        log.info("save order with deliver info : " + order.getDeliverCustomerName() + "," + order.getDeliverCustomerPhone() + "," + order.getDeliverCustomerAddress());
        List<CartItem> listItem = new ArrayList<>(cart.getCartItems());
        CustomerOrder customerOrder = new CustomerOrder(
                order.getDeliverCustomerName(),
                order.getDeliverCustomerAddress(),
                order.getDeliverCustomerPhone(),
                cart.calCartTotal(),
                customer,
                listItem
        );

        if ( customerOrderService.saveVO(customerOrder) !=null){
            cart.clearCartItem();
            model.addAttribute("customerOrder",customerOrder);
            log.info("return to payment page");
            return "template/user/customer/payment/payment";
        }

        return "redirect:/customer/product/checkout-page";
    }
}
