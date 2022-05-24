package com.notrika.service;

import com.notrika.entity.Tag;
import com.notrika.repository.DAO;
import com.notrika.repository.TagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class TagService implements DAO<Tag> {

    @Autowired
    private TagRepository repo;

    @Override
    public List<Tag> findAll() {
        return repo.findAll();
    }

    @Override
    public Tag findById(Long id) {
        return repo.findById(id).get();
    }

    @Override
    public void save(Tag vo) {
        repo.save(vo);
    }

    @Override
    public void delete(Long id) {
        repo.deleteById(id);
    }

    public Tag findByName(String name) {
        return repo.findByNameLike(name);
    }
}
