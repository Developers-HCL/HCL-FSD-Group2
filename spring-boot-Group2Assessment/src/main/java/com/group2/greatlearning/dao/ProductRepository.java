package com.group2.greatlearning.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestParam;

import com.group2.greatlearning.entity.Product;

@CrossOrigin
public interface ProductRepository extends JpaRepository<Product,Long> {
   Page<Product> findByCategoryId(@Param("id") Long id, Pageable pageable);
   Page<Product>  findByNameContaining(@Param("name")String name, Pageable pageable);
}
