package com.notrika.entity.tables;

import com.notrika.entity.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "ref")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class Ref extends BaseEntity {

    @Column(unique=true)
    private String refId;
    private String userAgent;
}
