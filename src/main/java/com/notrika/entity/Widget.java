package com.notrika.entity;

import com.notrika.helper.enums.WidgetType;
import io.micrometer.core.lang.Nullable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;


@Entity
@Table(name = "widget")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class Widget {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id;

    private String name;
    private String url;
    private WidgetType type;

    @OneToOne(targetEntity = ImageGallery.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "image_id")
    @Nullable
    @ToString.Exclude
    private ImageGallery image;

}


