package com.notrika.repository;

import com.notrika.entity.tables.Menu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface MenuRepository extends JpaRepository<Menu,Long>  {
}
