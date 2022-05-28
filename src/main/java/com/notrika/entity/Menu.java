package com.notrika.entity;

import lombok.*;
import org.hibernate.Hibernate;

import javax.persistence.*;
import java.util.List;
import java.util.Objects;


@Entity
@Table(name = "menu")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class Menu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id;
    private String url;
    private String name;
    private Long periority;
    private boolean active;

    private Long Parent_id;


    @OneToMany
    @JoinColumn(name = "Parent_id")
    private List<Menu> subMenu;

}
