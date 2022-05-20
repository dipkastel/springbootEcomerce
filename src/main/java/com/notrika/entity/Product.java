package com.notrika.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "products")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id;

    public String name;
    public String slug;
    public String type;
    public String status;
    public Boolean featured;
    public String catalogVisibility;
    @Column(columnDefinition = "LONGTEXT")
    public String description;
    public String shortDescription;
    public String sku;
    public Double price;
    public Double regularPrice;
    public Double salePrice;
    public Boolean purchasable;
    public Boolean onSale;
    public Integer stockQuantity;
    public String weight;
    public Boolean soldIndividually;
    public String averageRating;
    public Integer ratingCount;
    public String stockStatus;
    public Boolean reviewsAllowed;

    private Date updated;
    @PrePersist
    void updated() {
        this.updated = new Date();
    }

    @ManyToOne(targetEntity = Brand.class, cascade = CascadeType.MERGE)
    public Brand brand = null;

    @ManyToMany
    public List<Category> categories = new ArrayList<>();

    @OneToMany(targetEntity = productAttribute.class, cascade = CascadeType.ALL)
    public List<productAttribute> attributes = new ArrayList<>();

    @OneToMany(targetEntity = Tag.class, cascade = CascadeType.MERGE)
    public List<Tag> tags = new ArrayList<>();

    @OneToMany(targetEntity = ImageGallery.class, cascade = CascadeType.ALL)
    private List<ImageGallery> images;









}
