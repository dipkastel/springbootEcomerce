package com.notrika.service;

import com.notrika.entity.ImageGallery;
import com.notrika.repository.DAO;
import com.notrika.repository.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class ImageService implements DAO<ImageGallery> {
	@Autowired
	ImageRepository imgRep;
	@Override
	public List<ImageGallery> findAll() {
		// TODO Auto-generated method stub
		return imgRep.findAll();
	}

	@Override
	public ImageGallery findById(Long id) {
		// TODO Auto-generated method stub
		return imgRep.getOne(id);
	}

	@Override
	public void save(ImageGallery vo) {
		
		imgRep.save(vo);
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		imgRep.deleteById(id);
	}
	
}
