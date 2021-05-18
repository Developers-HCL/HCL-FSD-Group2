package com.group2.greatlearning.dto;

import lombok.Data;

import java.util.Set;

import com.group2.greatlearning.entity.Address;
import com.group2.greatlearning.entity.Customer;
import com.group2.greatlearning.entity.Order;
import com.group2.greatlearning.entity.OrderItem;

@Data
public class Purchase {

    private Customer customer;

    private Address shippingAddress;

    private  Address billingAddress;

    private Order order;

    private Set<OrderItem> orderItems;
}
