package com.notrika.entity.tables;

import com.notrika.entity.BaseEntity;
import com.notrika.entity.tables.Customer;
import com.notrika.entity.tables.Product;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "rates")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class Rating extends BaseEntity {


    private int starNumber;
    private String review;
    @OneToOne(targetEntity = Customer.class)
    private Customer customer;

    @OneToOne(targetEntity = Product.class)
    private Product product;
}
