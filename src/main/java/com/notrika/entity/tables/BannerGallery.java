package com.notrika.entity.tables;

import com.notrika.entity.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;


@Entity
@Table(name = "banner_gallery")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class BannerGallery extends BaseEntity {

    @Column(columnDefinition = "LONGBLOB")
    private byte[] image;

    private String url;
}
