package com.notrika.repository;

import com.notrika.entity.ResetPassword;
import com.notrika.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ResetPasswordRepository extends JpaRepository<ResetPassword,Long>  {
    ResetPassword findByUser(User user);
    ResetPassword findByResetToken(String resetToken);
}
