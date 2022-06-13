package com.notrika.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.notrika.entity.tables.CustomerOrder;

@Repository
public interface OrderRepository extends JpaRepository<CustomerOrder, Long> {

	@Query(value = "select count(*) from CustomerOrder o where day(o.orderDate) = ?1 "
			+ "and month(o.orderDate) = ?2 and year(o.orderDate) = ?3 ")
	int countOrderToDay(int day, int month, int year);

}
