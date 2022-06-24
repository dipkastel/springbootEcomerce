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

    @Query(value = "SELECT n.* FROM message n INNER JOIN (SELECT rs.usr, max(max_date) as max_date FROM ((SELECT n.reciver as usr ,max(n.created_date) as max_date FROM message n GROUP BY n.reciver) UNION (SELECT n.sender as usr ,max(n.created_date) as max_date FROM message n GROUP BY n.sender)) rs GROUP BY rs.usr) lm WHERE (lm.usr=n.reciver or lm.usr=n.sender) AND n.created_date = lm.max_date AND n.sender != lm.usr",nativeQuery = true)
    List<Message> getUsersAndLastMessages();

    @Query(value = "SELECT * from message where sender=:user or reciver=:user",nativeQuery = true)
    List<Message> getMessagesOfUser(@Param("user") String user);

    @Query(value = "UPDATE message set status='read' WHERE reciver = :reciver",nativeQuery = true)
    void readAllMessages(@Param("reciver") String reciver);
}
