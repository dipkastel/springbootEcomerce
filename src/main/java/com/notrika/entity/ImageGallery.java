package com.notrika.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import javax.persistence.*;


@Entity
@Table(name = "image_gallery")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class ImageGallery {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id;

    @Column(columnDefinition = "LONGBLOB")
    @ToString.Exclude
    private byte[] image;


}
