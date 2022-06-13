package com.notrika.entity.tables;

import com.notrika.entity.BaseEntity;
import com.notrika.entity.tables.CartItem;
import com.notrika.entity.tables.Customer;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "customer_order")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class CustomerOrder extends BaseEntity {


    private String deliverCustomerName;
    private String deliverCustomerAddress;
    private String deliverCustomerPhone;

    private double totalPrice;
    private Date orderDate;

    @ManyToOne (targetEntity = Customer.class)
    private Customer customer;
    @OneToMany(targetEntity = CartItem.class,cascade=CascadeType.ALL,fetch = FetchType.EAGER)
    private List<CartItem> cartItems;

    @PrePersist
    void orderDate() {
        this.orderDate = new Date();
    }

    public CustomerOrder(String deliverCustomerName, String deliverCustomerAddress, String deliverCustomerPhone, double totalPrice, Customer customer,List<CartItem> cartItems) {
        this.deliverCustomerName = deliverCustomerName;
        this.deliverCustomerAddress = deliverCustomerAddress;
        this.deliverCustomerPhone = deliverCustomerPhone;
        this.totalPrice = totalPrice;
        this.customer = customer;
        this.cartItems = cartItems;
    }


}
