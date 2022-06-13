package com.notrika.entity.tables;

import com.notrika.entity.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;


@Entity
@Table(name = "email_subscriber")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class EmailSubscriber extends BaseEntity {


    private String firstName;
    private String lastName;
    private String email;
}
