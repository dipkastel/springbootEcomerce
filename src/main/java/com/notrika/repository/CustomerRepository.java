package com.notrika.repository;

import com.notrika.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface CustomerRepository extends JpaRepository<Customer,Long>  {
    Long countByUserId(Long userId);
    Customer findByUserId(Long userId);
}
//commit
