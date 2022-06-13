package com.notrika.entity.tables;

import com.notrika.entity.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;
@Entity
@Table(name = "cart_item")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class CartItem extends BaseEntity {

    @OneToOne(targetEntity = Product.class)
    private Product product;
    private int sellingQuantity;
    private double totalPrice;

}
