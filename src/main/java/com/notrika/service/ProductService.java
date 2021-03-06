package com.notrika.service;

import com.notrika.entity.tables.Product;
import com.notrika.repository.DAO;
import com.notrika.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;
import java.util.List;


@Service
@Transactional
public class ProductService implements DAO<Product> {

    @Autowired
    private ProductRepository repo;

    @Override
    public List<Product> findAll() {
        return repo.findAll();
    }

    @Override
    public Product findById(Long id) {
        return repo.findById(id).get();
    }

    @Override
    public void save(Product vo) {
        repo.save(vo);
    }

    @Override
    public void delete(Long id) {
        repo.deleteById(id);
    }

    public List<Product> findByCategoryId(Long categoryId) {
        return repo.findByCategoryId(categoryId);
    }

    public List<Product> findByCategorySlog(String categorySlug) {
        return repo.findByCategorySlug(categorySlug);
    }

    public List<Product> findByCategoriesContainsAndBrandId(Long categoryId, Long brandId) {
        return repo.findByCategoriesContainsAndBrandId(categoryId, brandId);
    }

    public List<Product> findByCategoryIdAndTypeId(Long categoryId, Long typeId) {
        return null;
    }

    public List<Product> findByBrandId(Long brandId) {
        return repo.findByBrandId(brandId);
    }

    public List<Product> findByTypeName(String typeName) {
        return repo.findByType(typeName);
    }

    public List<Product> findByPriceBetween(Double min, Double max) {
        return repo.findByPriceBetween(min, max);
    }

    public List<Product> findByProductName(String productName) {
        return repo.findByNameContains(productName);
    }


    public List<Product> findByProductNameAndCategoryId(String name,Long categoryId) {
        return null;
    }

    public List<Product> findAllIgnoreStatus(){
        return repo.findAll();
    }

    public List<Long> findTop5(){
		Calendar c = Calendar.getInstance();
		int month = c.get(Calendar.MONTH) + 1;
		int year = c.get(Calendar.YEAR);
        return repo.findTop5(month, year);
    }

    public List<Product> findProductContains(String keyword){
        return repo.findProductContains(keyword);
    }
    public List<Product> findProductContainsByCategoryId(String keyword, Long categoryId){
        return null;
    }

    public void deleteAll() {
        repo.deleteAll();
    }


    public List<Product> findByPagination(int _page ,int per_page) {
        int page = _page*per_page;
        return repo.findFromAndTake(page,per_page);
    }
    public List<Product> findByFilter(String CategoryName,Integer limit) {
        return repo.findByFilter(limit,"publish");
    }

    public int productCounts() {
       return repo.productCounts("publish");

    }
}
