package com.notrika.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.notrika.entity.ImageGallery;

public interface ImageRepository extends JpaRepository<ImageGallery, Long> {
	
}
