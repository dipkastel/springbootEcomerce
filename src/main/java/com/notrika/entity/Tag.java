package com.notrika.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;


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

    @OneToOne(targetEntity = ImageGallery.class, cascade = CascadeType.ALL)
    private ImageGallery image;

}
