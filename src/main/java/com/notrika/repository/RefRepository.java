package com.notrika.repository;

import com.notrika.entity.Rating;
import com.notrika.entity.Ref;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface RefRepository extends JpaRepository<Ref, Long> {
	Ref findByRefId(String ref);
}
