package com.notrika.entity.tables;

import com.notrika.entity.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "customers")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class Customer extends BaseEntity {


    private String firstName;
    private String lastName;
    private String email;
    private String nationalCode;


    @OneToOne(targetEntity = User.class)
    private User user;

}
