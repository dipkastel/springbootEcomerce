package com.notrika.repository;

import com.notrika.entity.tables.Menu;
import com.notrika.entity.tables.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface MessageRepository extends JpaRepository<Message,Long>  {

    @Query(value = "SELECT m1.* FROM message m1 LEFT JOIN message m2 ON (m1.user_id=m2.user_id AND m1.created_date < m2.created_date) WHERE m2.id IS NULL",nativeQuery = true)
    List<Message> getUsersAndLastMessages();
}
