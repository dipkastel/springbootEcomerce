package com.notrika.entity.tables;

import com.notrika.entity.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "attributes")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class productAttribute extends BaseEntity {

    public String name;
    @Column(columnDefinition = "LONGTEXT")
    public String option;


}
