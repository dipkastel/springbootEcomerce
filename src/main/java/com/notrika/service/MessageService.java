package com.notrika.service;

import com.notrika.entity.tables.Message;
import com.notrika.repository.DAO;
import com.notrika.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class MessageService implements DAO<Message> {

    @Autowired
    private MessageRepository repo;

    @Override
    public List<Message> findAll() {
        return repo.findAll();
    }

    @Override
    public Message findById(Long id) {
        return repo.findById(id).get();
    }

    @Override
    public void save(Message vo) {
        repo.save(vo);
    }

    @Override
    public void delete(Long id) {
        repo.deleteById(id);
    }

    public List<Message> getUsersAndLastMessages() {
        return repo.getUsersAndLastMessages();
    }

    public List<Message> getMessagesOfUser(String userUnique) {
        return repo.getMessagesOfUser(userUnique);
    }

    public void readAllMessages(String id) {
        repo.readAllMessages(id);
    }
}
//commit
