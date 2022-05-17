package com.notrika.service;

import com.notrika.entity.Customer;
import com.notrika.repository.CustomerRepository;
import com.notrika.repository.DAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class CustomerService implements DAO<Customer> {

    @Autowired
    private CustomerRepository repo;


    @Override
    public List<Customer> findAll() {
        return repo.findAll() ;
    }

    @Override
    public Customer findById(Long id) {

        return repo.findById(id).get();
    }

    @Override
    public void save(Customer vo) {
        repo.save(vo);
    }

    @Override
    public void delete(Long id) {
        repo.deleteById(id);
    }

    public Long countByUserId(Long userId){
        return repo.countByUserId(userId);
    }

    public Customer findByUserId(Long userId){
        return repo.findByUserId(userId);
    }

    public void deleteAll() {
        repo.deleteAll();
    }
}
//commit
