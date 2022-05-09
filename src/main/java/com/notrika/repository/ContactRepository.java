package com.notrika.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.notrika.entity.Contact;

import antlr.collections.List;

/**
 * @author TranDung
 *
 */
@Repository
public interface ContactRepository extends JpaRepository<Contact, Long> {
	 List findByNameContaining(String a);
}
