package com.notrika.entity.tables;

import com.notrika.entity.BaseEntity;
import io.micrometer.core.lang.Nullable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;


@Entity
@Table(name = "tag")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class Tag extends BaseEntity {

    private String name;
    private String slug="";
    private String description="";
    private Boolean masterTag=false;


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
