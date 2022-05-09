package com.notrika.entity;


import lombok.Getter;

import javax.persistence.*;
import java.io.Serializable;


@MappedSuperclass
@Getter
//@Setter
public  class BaseEntity implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
}
