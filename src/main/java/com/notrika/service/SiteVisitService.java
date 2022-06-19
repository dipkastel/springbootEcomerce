package com.notrika.service;

import com.notrika.entity.tables.Message;
import com.notrika.entity.tables.SiteVisit;
import com.notrika.repository.DAO;
import com.notrika.repository.MessageRepository;
import com.notrika.repository.SiteVisitRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class SiteVisitService implements DAO<SiteVisit> {

    @Autowired
    private SiteVisitRepository repo;

    @Override
    public List<SiteVisit> findAll() {
        return repo.findAll();
    }

    @Override
    public SiteVisit findById(Long id) {
        return repo.findById(id).get();
    }

    @Override
    public void save(SiteVisit vo) {
        repo.save(vo);
    }

    @Override
    public void delete(Long id) {
        repo.deleteById(id);
    }

}
