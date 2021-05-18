package com.group2.greatlearning.dao;

import java.util.List;

import com.group2.greatlearning.entity.Order;

public interface OrdersDAO {
    public List<Order> findAll();
}
