package com.notrika.repository;

import com.notrika.entity.tables.Menu;
import com.notrika.entity.tables.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface MessageRepository extends JpaRepository<Message,Long>  {

    @Query(value = "SELECT m1.* FROM message m1 LEFT JOIN message m2 ON (m1.sender=m2.sender AND m1.created_date < m2.created_date) WHERE m2.id IS NULL",nativeQuery = true)
    List<Message> getUsersAndLastMessages();

    @Query(value = "SELECT * from message where sender=:customer_uniq or reciver=:customer_uniq",nativeQuery = true)
    List<Message> getMessagesOfUser(@Param("customer_uniq") String customer_uniq);

    @Query(value = "UPDATE message set status='read' WHERE reciver = :customer_uniq",nativeQuery = true)
    void readAllMessages(@Param("customer_uniq") String customer_uniq);
}
