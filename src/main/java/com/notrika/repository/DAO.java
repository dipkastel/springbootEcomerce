package com.notrika.repository;

import java.util.List;

public interface DAO<T> {
    List<T> findAll();
    T findById(Long id);
    void save(T vo);
    void delete(Long id);
}
