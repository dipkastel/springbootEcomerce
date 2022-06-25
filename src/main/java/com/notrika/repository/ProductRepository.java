package com.notrika.repository;

import com.notrika.entity.tables.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ProductRepository extends JpaRepository<Product,Long>  {
    List<Product> findByBrandId(Long brandId);
    List<Product> findByType(String typeName);
    List<Product> findByCategoriesContainsAndBrandId(Long categoryId,Long brandId);
    List<Product> findByPriceBetween(Double min,Double max);
    List<Product> findByNameContains(String name);

    @Query(
            value = "SELECT ca.id FROM payments p INNER JOIN customer_order_cart_items c ON  c.customer_order_id = p.customer_order_id INNER JOIN cart_item ca ON c.cart_items_id = ca.id WHERE p.status =true AND MONTH(p.payment_date)=?1 AND YEAR(p.payment_date)=?2 GROUP BY ca.id ORDER BY sum(ca.selling_quantity) DESC LIMIT 5",
            nativeQuery = true)
    List<Long> findTop5(int month, int year);

    @Query(value="select * from products p left join brands b on p.brand_id = b.id left join categories c on p.category_id = c.id  where  p.name LIKE %:keyword%  or b.name LIKE %:keyword% or c.name LIKE %:keyword% group by p.id",
            nativeQuery = true)
    List<Product> findProductContains(@Param("keyword") String keyword);

    @Query(value="select p.* from products p left join products_categories pc on p.id = pc.product_id WHERE pc.categories_id = :categoryId ",
            nativeQuery = true)
    List<Product> findByCategoryId(@Param("categoryId") Long categoryId);

    @Query(value="select p.* from products p left join products_categories pc on p.id = pc.product_id left join categories c on pc.categories_id = c.id where c.slug LIKE %:CategorySlug% ",
            nativeQuery = true)
    List<Product> findByCategorySlug(@Param("CategorySlug") String CategorySlug);

    @Query(value = "select * from products p order by id limit :start , :itemcount ",nativeQuery = true)
    List<Product> findFromAndTake(@Param("start") Integer startFrom,@Param("itemcount") Integer itemcount);

    @Query(value = "select * from products p where status = :status order by id  limit :limit",nativeQuery = true)
    List<Product> findByFilter(@Param("limit") Integer limit,@Param("status") String status);

    @Query(value = "select Count(*) from products p where status = :status",nativeQuery = true)
    int productCounts(@Param("status") String status);


//
}
//commit
