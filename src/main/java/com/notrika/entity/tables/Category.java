package com.notrika.entity.tables;

import com.notrika.entity.BaseEntity;
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
public class Category extends BaseEntity {



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
