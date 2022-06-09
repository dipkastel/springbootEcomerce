package com.notrika.entity;

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
public class Ref {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id;
    @Column(unique=true)
    private String refId;
    private String userAgent;
}
