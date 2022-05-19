package com.notrika.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "products")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class productAttribute {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id;
    public String name;
    public String option;
}
