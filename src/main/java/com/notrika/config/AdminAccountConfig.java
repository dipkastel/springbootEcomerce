package com.notrika.config;

import com.notrika.repository.UserRepository;
import lombok.Data;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.security.crypto.password.PasswordEncoder;



@Profile("addAdminAccount")
@ConfigurationProperties(prefix = "user.admin")
@Configuration
@Data
public class AdminAccountConfig {
    private String username;
    private String password;
    private String email;

    private String usernameTrainee;
    private String passwordTrainee;
    private String emailTrainee;

    @Bean
    public CommandLineRunner loadData(UserRepository userRepo, PasswordEncoder passwordEncoder, AdminAccountConfig admin) {
        return new CommandLineRunner() {
            @Override
            public void run(String... args) {
//
//                        userRepo.save(new User(
//                                passwordEncoder.encode(admin.getPasswordTrainee().trim()),
//                                "ROLE_ADMIN_TRAINEE",
//                                "",
//                                true));
//                        userRepo.save(new User(
//                                passwordEncoder.encode(admin.getPassword().trim()),
//                                "ROLE_ADMIN",
//                                "",
//                                true));
            }
        };
    }
}
