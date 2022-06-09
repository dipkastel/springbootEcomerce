package com.notrika.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "attributes")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class productAttribute {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id;
    public String name;
    @Column(columnDefinition = "LONGTEXT")
    public String option;


}
