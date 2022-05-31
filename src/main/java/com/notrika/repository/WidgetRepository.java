package com.notrika.repository;

import com.notrika.entity.Tag;
import com.notrika.entity.Widget;
import com.notrika.helper.enums.WidgetType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WidgetRepository extends JpaRepository<Widget,Long>  {
    List<Widget> findByType(WidgetType type);

}
