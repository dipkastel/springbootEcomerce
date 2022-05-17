package com.notrika.repository;

import com.notrika.entity.CustomerOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface CustomerOrderRepository extends JpaRepository<CustomerOrder,Long>  {
    CustomerOrder findTop1ByCustomerIdOrderByOrderDateDesc(Long customerId);
//    List<CustomerOrder> findByCustomerId(Long customerId);
    List<CustomerOrder> findByCustomerIdOrderByOrderDateDesc(Long customerId);

}
//commit
