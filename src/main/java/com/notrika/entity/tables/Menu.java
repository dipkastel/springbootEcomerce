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

    public String url;
    public String name;
    public Long periority;
    public boolean active;

    public Long Parent_id;


    @OneToMany
    @JoinColumn(name = "Parent_id")
    @ToString.Exclude
    private List<Menu> subMenu;

}
