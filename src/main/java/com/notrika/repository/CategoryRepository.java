package com.notrika.repository;

import com.notrika.entity.tables.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface CategoryRepository extends JpaRepository<Category,Long>  {
    Category findByName(String name);
}
//commit
