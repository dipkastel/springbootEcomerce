package com.notrika.entity;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.notrika.wpRestApi.entities.common.Image;
import com.notrika.wpRestApi.entities.common.Links;
import com.notrika.wpRestApi.entities.product.Attribute;
import com.notrika.wpRestApi.entities.product.Brand;
import com.notrika.wpRestApi.entities.product.Dimensions;
import com.notrika.wpRestApi.entities.product.MetaDatum;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;
import java.awt.event.HierarchyListener;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "categories")
@AllArgsConstructor
@EntityListeners( { HierarchyListener.class })
@RequiredArgsConstructor
@Data
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


    @Column(name="parent_id", insertable=false, updatable=false)
    private Long parentId;
    @OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL)
    @JoinColumn(name="parent_id")
    private List<Category> subCategories;


    public Date updated;
    @PrePersist
    void updated() {
        this.updated = new Date();
    }

}
