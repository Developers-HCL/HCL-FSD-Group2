package com.group2.greatlearning.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group2.greatlearning.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Long> {



}
