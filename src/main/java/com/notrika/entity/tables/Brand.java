package com.notrika.entity.tables;

import com.notrika.entity.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "brands")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class Brand extends BaseEntity {


    private String name;
    public String slug;


    @OneToMany
    public List<Product> products = new ArrayList<>();

}
