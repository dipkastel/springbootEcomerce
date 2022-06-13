package com.notrika.entity.tables;

import com.notrika.entity.FormResult;
import lombok.*;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.persistence.*;

@Entity
@Table(name = "users")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class User extends FormResult {
    private   String phoneNumber;
    private   String password;
    private  String role;
    private   boolean enabled;

}
