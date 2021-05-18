package com.group2.greatlearning.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.group2.greatlearning.dto.Purchase;
import com.group2.greatlearning.dto.PurchaseResponse;
import com.group2.greatlearning.service.CheckoutService;

@CrossOrigin
@RestController
@RequestMapping("/api/checkout")
public class CheckoutController {

    private CheckoutService checkoutService;

    @Autowired
    public CheckoutController(CheckoutService checkoutService){
        this.checkoutService = checkoutService;
    }

    @PostMapping("/purchase")
    public PurchaseResponse placeOrder
    (@RequestBody Purchase purchase){
        PurchaseResponse purchaseResponse = 
        		checkoutService.placeOrder(purchase);
        return purchaseResponse;
    }
}
