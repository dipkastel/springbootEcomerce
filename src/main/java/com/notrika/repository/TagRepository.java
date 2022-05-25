package com.notrika.repository;

import com.notrika.entity.Tag;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TagRepository extends JpaRepository<Tag,Long>  {
    Tag findByNameLike(String name);

    @Query(value = "select * from tag order by id limit :start , :itemcount ",nativeQuery = true)
    List<Tag> findByPagination(Long start, Long itemcount);

}
