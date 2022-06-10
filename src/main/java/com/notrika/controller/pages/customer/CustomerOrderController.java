package com.notrika.controller.pages.customer;

import com.notrika.entity.*;
import com.notrika.helper.UserHelper;
import com.notrika.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/customer/order")
public class CustomerOrderController {

    private final CustomerOrderService customerOrderService;
    private final CustomerService customerService;
    private final PaymentService paymentService;
    private final UserService userService;
    private final UserHelper userHelper;
    @Autowired
    public CustomerOrderController(CustomerOrderService customerOrderService, CustomerService customerService, PaymentService paymentService,UserService userService,UserHelper userHelper) {
        this.customerOrderService = customerOrderService;
        this.customerService = customerService;
        this.paymentService = paymentService;
        this.userService = userService;
        this.userHelper=userHelper;
    }

    @GetMapping
    public String customerOrderPage(Authentication authentication, Model model) {
        User user = userHelper.getUser(authentication,userService);
        Customer customer = customerService.findByUserId(user.getId());
        List<CustomerOrder> orders;

        try{
            orders =  customerOrderService.findAllOrderByCustomerId(customer.getId());
        }catch (Exception e){
            orders = new ArrayList<>();
        }

        model.addAttribute("customerOrders",orders );
        return "template/user/customer/invoice/invoice-page";
    }

    @GetMapping("/detail")
    public String customerOrderDetail(Authentication authentication, Model model, @RequestParam("id") Long id) {

        CustomerOrder order = customerOrderService.findById(id);
        Long countPayment = paymentService.countByCustomerOrderId(order.getId());
        if (countPayment > 0) {
            Payment payment = paymentService.findPaymentByCustomerOrderId(order.getId());
            model.addAttribute("payment", payment);
        }

        model.addAttribute("order", order);
        return "template/user/customer/invoice/invoice-detail";
    }

    @GetMapping("/json/order")
    @ResponseBody
    public List<CustomerOrder> getJsonOrder(Authentication authentication) {
        User user = userHelper.getUser(authentication,userService);
        Customer customer = customerService.findByUserId(user.getId());
        return customerOrderService.findAllOrderByCustomerId(customer.getId());
    }
}
