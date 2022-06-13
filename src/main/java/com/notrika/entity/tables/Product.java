package com.notrika.entity.tables;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.notrika.entity.BaseEntity;
import lombok.*;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "products")
@AllArgsConstructor
@RequiredArgsConstructor
@Getter
@Setter
public class Product extends BaseEntity {



    public String name;
    public String slug;
    public String type;
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

    @JsonIgnoreProperties({"products"})
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL )
    @ToString.Exclude
    public Set<Category> categories = new HashSet<>();

    @ManyToMany()
    Set<Tag> tags = new HashSet<>();

    @OneToMany( cascade = CascadeType.ALL)
    @ToString.Exclude
    public Set<productAttribute> attributes =new HashSet<>();


    @OneToMany(targetEntity = ImageGallery.class, cascade = CascadeType.ALL)
    private List<ImageGallery> images;









}
