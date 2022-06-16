package com.notrika.entity.tables;

import com.notrika.entity.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.lang.Nullable;

import javax.persistence.*;

@Entity
@Table(name = "message")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class Message extends BaseEntity {


    private String message;

    private String customerUniq;

    private boolean Unread=true;
    private boolean fromAdmin;

    @OneToOne(targetEntity = User.class)
    private User user;
}
