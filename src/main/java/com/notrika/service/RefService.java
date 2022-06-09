package com.notrika.service;

import com.notrika.entity.ImageGallery;
import com.notrika.entity.Ref;
import com.notrika.repository.DAO;
import com.notrika.repository.ImageRepository;
import com.notrika.repository.RefRepository;
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

	public Ref findByRefid(String id) {
		return rep.findByRefId(id);
	}

	public Ref save(String userAgent,String ipAddress) {
		Ref ref = new Ref();
		ref.setUserAgent(userAgent+"ip:"+ipAddress);
		ref.setRefId(getAlphaNumericString(20));
		save(ref);
		return ref;
	}

	static String getAlphaNumericString(int n)
	{
		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvxyz";
		StringBuilder sb = new StringBuilder(n);

		for (int i = 0; i < n; i++) {
			int index
					= (int)(AlphaNumericString.length()
					* Math.random());
			sb.append(AlphaNumericString
					.charAt(index));
		}
		return sb.toString();
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
