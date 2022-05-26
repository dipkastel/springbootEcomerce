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
    private String slug="";
    private String description="";
    private Boolean masterTag=false;
    private Long image_id;


    @ManyToMany
    @ToString.Exclude
    private Set<Product> products = new HashSet<>();

    @OneToOne
    @JoinColumn(name = "image_id")
    @Nullable
    private ImageGallery image;

    public void setTag(Tag tag) {
        this.setName(tag.name);
        this.setSlug(tag.slug);
        this.setDescription(tag.description);
        this.setMasterTag(tag.masterTag);
        this.setImage(tag.image);
    }
}
