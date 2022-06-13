package com.notrika.entity.tables;

import com.notrika.entity.BaseEntity;
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
public class ImageGallery extends BaseEntity {


    @Column(columnDefinition = "LONGBLOB")
    @ToString.Exclude
    private byte[] image;


}
