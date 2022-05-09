package com.notrika.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "reset_password")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class ResetPassword {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id;

    private String resetToken;

    @OneToOne(targetEntity = User.class)
    private User user;


    public ResetPassword(String resetToken, User user) {
        this.resetToken = resetToken;
        this.user = user;
    }
}
