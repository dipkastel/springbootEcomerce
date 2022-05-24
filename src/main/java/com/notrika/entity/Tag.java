package com.notrika.entity;

import io.micrometer.core.lang.Nullable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Entity
@Table(name = "tag")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class Tag {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id;

    private String name;
    private String slug;
    private String description;
    private Boolean MasterTag;


    @ManyToMany
    @ToString.Exclude
    private Set<Product> products = new HashSet<>();

    @OneToOne(targetEntity = ImageGallery.class, cascade = CascadeType.ALL)
    @Nullable
    private ImageGallery image;

}
