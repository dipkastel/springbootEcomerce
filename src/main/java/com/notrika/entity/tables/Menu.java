package com.notrika.entity.tables;

import com.notrika.entity.BaseEntity;
import lombok.*;

import javax.persistence.*;
import java.util.List;


@Entity
@Table(name = "menu")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class Menu extends BaseEntity {

    private String url;
    private String name;
    private Long periority;
    private boolean active;

    private Long Parent_id;


    @OneToMany
    @JoinColumn(name = "Parent_id")
    private List<Menu> subMenu;

}
