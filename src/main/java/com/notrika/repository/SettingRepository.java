package com.notrika.repository;

import com.notrika.entity.Setting;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SettingRepository extends JpaRepository<Setting, Long> {
	 Setting findBySkey(String Skey);
	List<Setting> findBySection(String section);
}
