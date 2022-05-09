package com.notrika.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.notrika.entity.EmailSubscriber;

@Repository
public interface SubscriberRepository extends JpaRepository<EmailSubscriber,Long>  {
	Optional<EmailSubscriber> findById(Long id);
	List<EmailSubscriber> findAll();
	Long countByEmail(String email);
}
