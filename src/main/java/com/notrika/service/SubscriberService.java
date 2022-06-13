package com.notrika.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.notrika.entity.tables.EmailSubscriber;
import com.notrika.repository.DAO;
import com.notrika.repository.SubscriberRepository;

@Service
@Transactional
public class SubscriberService implements DAO<EmailSubscriber> {
    private final SubscriberRepository subscriber;

    @Autowired
    public SubscriberService(SubscriberRepository sub) {
        this.subscriber = sub;
    }

    @Override
    public List<EmailSubscriber> findAll() {
        return subscriber.findAll();
    }

    @Override
    public EmailSubscriber findById(Long id) {
        // TODO Auto-generated method stub
        return subscriber.findById(id).get();
    }

    @Override
    public void save(EmailSubscriber vo) {
        // TODO Auto-generated method stub
        subscriber.save(vo);
    }

    @Override
    public void delete(Long id) {
        // TODO Auto-generated method stub
        subscriber.deleteById(id);
    }

    public Long countByEmail(String email) {
        return subscriber.countByEmail(email);
    }


}
