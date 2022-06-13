package com.notrika.repository;

import com.notrika.entity.tables.Type;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface TypeRepository extends JpaRepository<Type,Long>  {
    List<Type> findByCategoryId(Long id);
}
//commit
