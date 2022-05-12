package com.notrika.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.notrika.entity.BannerGallery;


@Repository
public interface BannerGalleryRepository extends JpaRepository<BannerGallery, Long> {

}
