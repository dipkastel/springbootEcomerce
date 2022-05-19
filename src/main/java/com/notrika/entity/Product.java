package com.notrika.entity;

import com.notrika.wpRestApi.entities.product.Dimensions;
import com.notrika.wpRestApi.entities.product.MetaDatum;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;
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

    @ManyToOne(targetEntity = Brand.class,fetch = FetchType.EAGER)
    private Brand brand;
    @OneToMany(targetEntity = Brand.class, cascade = CascadeType.ALL)
    public List<Brand> brands = null;

    @ManyToOne(targetEntity = Category.class,fetch = FetchType.EAGER)
    private Category category;
    @OneToMany(targetEntity = Category.class, cascade = CascadeType.ALL)
    public List<Category> categories = null;

    @OneToMany(targetEntity = productAttribute.class, cascade = CascadeType.ALL)
    public List<productAttribute> attributes = null;

    @OneToMany(targetEntity = Tag.class, cascade = CascadeType.ALL)
    public List<Tag> tags = null;

    @OneToMany(targetEntity = ImageGallery.class, cascade = CascadeType.ALL)
    private List<ImageGallery> images;









}
