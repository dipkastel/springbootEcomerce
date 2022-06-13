package com.notrika.repository;

import com.notrika.entity.tables.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface UserRepository extends JpaRepository<User,Long>  {
    User  findByPhoneNumber(String phoneNumber);
    int countByPhoneNumber(String phoneNumber);

}
