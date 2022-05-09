package com.notrika.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.notrika.entity.Contact;
import com.notrika.repository.ContactRepository;
import com.notrika.repository.DAO;


/**
 * @author TranDung
 *
 */
@Service
@Transactional
public class ContactService implements DAO<Contact>{

	private final ContactRepository repo;
    @Autowired
    public ContactService(ContactRepository repo) {
    	this.repo = repo;
    }
    @Override
    public void save(Contact vo) {
        repo.save(vo);
    }
	@Override
	public List<Contact> findAll() {
		// TODO Auto-generated method stub
		return repo.findAll();
	}
	@Override
	public Contact findById(Long id) {
		// TODO Auto-generated method stub
		return repo.findById(id).get();
	}
	@Override
	public void delete(Long id) {
		repo.deleteById(id);
		
	}
}
