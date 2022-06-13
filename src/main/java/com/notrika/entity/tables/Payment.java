package com.notrika.entity.tables;

import com.notrika.entity.BaseEntity;
import com.notrika.entity.tables.CustomerOrder;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "payments")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class Payment extends BaseEntity {


    private double amount;
    private Date paymentDate;
    private String paymentMethod; //cash
    private boolean tracked;

    @OneToOne(targetEntity = CustomerOrder.class)
    private CustomerOrder customerOrder;

    @PrePersist
    void orderDate() {
        this.paymentDate = new Date();
        this.tracked = false;
    }

}
