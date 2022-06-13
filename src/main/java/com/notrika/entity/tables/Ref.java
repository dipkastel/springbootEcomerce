package com.notrika.entity.tables;

import com.notrika.entity.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.hibernate.validator.constraints.UniqueElements;
import org.springframework.context.annotation.Primary;

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
