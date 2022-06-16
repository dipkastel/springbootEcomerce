package com.notrika.entity;


import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;
import org.springframework.lang.Nullable;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;


@Getter
@Setter
@ToString
@RequiredArgsConstructor
@SuperBuilder
@MappedSuperclass
public  class BaseEntity implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Nullable
    private LocalDateTime createdDate  = LocalDateTime.now();
    @Nullable
    private LocalDateTime UpdateDate = LocalDateTime.now();
    @Nullable
    private boolean isDeleted = false;
    @Nullable
    private String Status = "normal";

}
