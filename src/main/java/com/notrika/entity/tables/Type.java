package com.notrika.entity.tables;

import com.notrika.entity.BaseEntity;
import com.notrika.entity.tables.Category;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;


@Entity
@Table(name = "types")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class Type extends BaseEntity {

    private String name;
    @ManyToOne(targetEntity = Category.class)
    private Category category;
}
