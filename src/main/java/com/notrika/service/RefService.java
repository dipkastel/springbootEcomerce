package com.notrika.service;

import com.notrika.entity.ImageGallery;
import com.notrika.entity.Ref;
import com.notrika.helper.StringHelper;
import com.notrika.repository.DAO;
import com.notrika.repository.ImageRepository;
import com.notrika.repository.RefRepository;
import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Random;

@Service
@Transactional
public class RefService implements DAO<Ref> {
	@Autowired
	RefRepository rep;
	@Override
	public List<Ref> findAll() {
		return rep.findAll();
	}

	@Override
	public Ref findById(Long id) {
		return rep.getOne(id);
	}

	public Ref findByRefid(String id) throws NotFoundException {
		Ref ref = rep.findByRefId(id);
		if(ref==null)
			throw new NotFoundException("this form Not Requested!");
		rep.delete(ref);
		return ref;
	}

	public Ref save(String userAgent,String ipAddress) {
		Ref ref = new Ref();
		ref.setUserAgent(userAgent+"ip:"+ipAddress);
		ref.setRefId(StringHelper.getAlphaNumericString(20));
		save(ref);
		return ref;
	}

	@Override
	public void save(Ref ref) {
		rep.save(ref);
	}

	@Override
	public void delete(Long id) {
		rep.deleteById(id);
	}
	
}
