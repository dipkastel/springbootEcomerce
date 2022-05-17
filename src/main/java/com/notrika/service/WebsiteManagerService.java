package com.notrika.service;

import com.notrika.entity.Cart;
import com.notrika.entity.User;
import com.notrika.entity.UserDetail;
import com.notrika.repository.UserRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class WebsiteManagerService  {

    @Autowired
    CustomerOrderService customerOrderService;
    @Autowired
    CustomerService customerService;
    @Autowired
    ProductService productService;

    @Autowired
    PaymentService paymentService;

    @Autowired
    Cart cart;


    public void ClearDataBase(){

    }

    public void ClearProducts(){
        paymentService.deleteAll();
        customerOrderService.deleteAll();
        customerService.deleteAll();
        productService.deleteAll();
    }

}
