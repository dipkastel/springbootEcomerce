package com.notrika.service;

import com.notrika.entity.Menu;
import com.notrika.repository.DAO;
import com.notrika.repository.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;


@Service
@Transactional
public class MenuService implements DAO<Menu> {

    @Autowired
    private MenuRepository repo;

    @Override
    public List<Menu> findAll() {
        return repo.findAll().stream().filter(o-> o.getParent_id() == null).collect(Collectors.toList());
    }

    @Override
    public Menu findById(Long id) {
        return repo.findById(id).get();
    }

    @Override
    public void save(Menu vo) {
        repo.save(vo);
    }

    @Override
    public void delete(Long id) {
        repo.deleteById(id);
    }

}
//commit
