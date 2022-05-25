package com.notrika.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.util.*;

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

    @ManyToOne
    @JoinColumn(name = "brand_id")
    public Brand brand = null;

    @ManyToMany(mappedBy = "products",targetEntity = Category.class, cascade = CascadeType.ALL)
    public List<Category> categories = new ArrayList<>();

    @ManyToMany(mappedBy = "products")
    @ToString.Exclude
    Set<Tag> tags = new HashSet<>();

    @OneToMany(mappedBy = "product",targetEntity = productAttribute.class, cascade = CascadeType.ALL)
    public Set<productAttribute> attributes =new HashSet<>();


    @OneToMany(targetEntity = ImageGallery.class, cascade = CascadeType.ALL)
    private List<ImageGallery> images;









}
