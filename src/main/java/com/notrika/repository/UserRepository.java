package com.notrika.repository;

import com.notrika.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface UserRepository extends JpaRepository<User,Long>  {
    User  findByUsername(String username);
    int countByUsername(String username);
    int countByEmail(String email);
    User findByUsernameAndEmail (String username,String email);
    User findByEmail(String email);

}
