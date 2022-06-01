package com.notrika.entity;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.notrika.wpRestApi.entities.common.Image;
import com.notrika.wpRestApi.entities.common.Links;
import com.notrika.wpRestApi.entities.product.Attribute;
import com.notrika.wpRestApi.entities.product.Brand;
import com.notrika.wpRestApi.entities.product.Dimensions;
import com.notrika.wpRestApi.entities.product.MetaDatum;
import lombok.*;

import javax.persistence.*;
import java.awt.event.HierarchyListener;
import java.util.*;

@Entity
@Table(name = "categories")
@AllArgsConstructor
@EntityListeners( { HierarchyListener.class })
@RequiredArgsConstructor
@Getter
@Setter
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id;

    private String name;
    public String slug;

    @Column(columnDefinition = "LONGTEXT")
    public String description;
    public String display;
    public Integer menuOrder;




    @OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL)
    @JoinColumn(name="parent_id")
    @ToString.Exclude
    private List<Category> subCategories;

    @ManyToMany(fetch = FetchType.LAZY,cascade=CascadeType.ALL,mappedBy = "categories")
    @ToString.Exclude
    private Set<Product> products = new HashSet<>();

    public Date updated;
    @PrePersist
    void updated() {
        this.updated = new Date();
    }

}
