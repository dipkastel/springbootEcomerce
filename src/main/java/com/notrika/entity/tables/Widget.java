package com.notrika.entity.tables;

import com.notrika.entity.BaseEntity;
import com.notrika.entity.tables.ImageGallery;
import com.notrika.helper.enums.WidgetType;
import io.micrometer.core.lang.Nullable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import javax.persistence.*;


@Entity
@Table(name = "widget")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class Widget extends BaseEntity {


    private String name;
    private String url;
    private WidgetType type;


    @OneToOne(targetEntity = ImageGallery.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "image_id")
    @Nullable
    @ToString.Exclude
    private ImageGallery image;

}


