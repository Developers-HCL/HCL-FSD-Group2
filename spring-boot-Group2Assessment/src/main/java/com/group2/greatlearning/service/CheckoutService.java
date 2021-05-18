package com.group2.greatlearning.service;

import com.group2.greatlearning.dto.Purchase;
import com.group2.greatlearning.dto.PurchaseResponse;

public interface CheckoutService {

    PurchaseResponse placeOrder(Purchase purchase);

}
