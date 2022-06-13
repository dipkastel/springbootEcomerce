package com.notrika.repository;

import com.notrika.entity.tables.Widget;
import com.notrika.helper.enums.WidgetType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WidgetRepository extends JpaRepository<Widget,Long>  {
    List<Widget> findByType(WidgetType type);

    @Query(value = "select type from widget as w GROUP BY type",nativeQuery = true)
    List<WidgetType> findAllGroupByType();

}
