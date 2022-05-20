package com.notrika.repository;

import com.notrika.entity.Brand;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface BrandRepository extends JpaRepository<Brand,Long>  {
    List<Brand> findByNameContains(String brandName);
    Brand findByName(String name);
}
//commit
