package com.notrika.entity;

import lombok.*;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.persistence.*;

@Entity
@Table(name = "users")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class User extends FormResult {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id;

    private   String phoneNumber;
    private   String password;
    private  String role;
    private   boolean enabled;

    public User(String password,String role,String phoneNumber, boolean enabled) {
        this.password = password;
        this.role = role;
        this.enabled = enabled;
        this.phoneNumber = phoneNumber;
    }

    public User toUser(PasswordEncoder passwordEncoder){
        return new User(
                passwordEncoder.encode(password),
                "ROLE_USER",
                phoneNumber,
                true);
    }
}
