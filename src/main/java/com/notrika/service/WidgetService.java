package com.notrika.service;

import com.notrika.entity.Widget;
import com.notrika.helper.enums.WidgetType;
import com.notrika.repository.DAO;
import com.notrika.repository.WidgetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class WidgetService implements DAO<Widget> {

    @Autowired
    private WidgetRepository repo;

    @Override
    public List<Widget> findAll() {
        return repo.findAll();
    }

    @Override
    public Widget findById(Long id) {
        return repo.findById(id).get();
    }

    @Override
    public void save(Widget vo) {
        repo.save(vo);
    }

    @Override
    public void delete(Long id) {
        repo.deleteById(id);
    }

    public List<Widget> findByType(WidgetType type) {
        return repo.findByType(type);
    }

    public Long findAllCount() {
        return repo.count();
    }
}
