package com.example.assignment.Service;

import com.example.assignment.Entities.Cart;
import com.example.assignment.Entities.Gundam;
import com.example.assignment.Repository.ICartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {
    @Autowired
    public ICartRepository cartResponsitory;

    public Cart add(Cart cart) {
        return cartResponsitory.save(cart);
    }
    public List<Cart> list() {
        return cartResponsitory.findAll();
    }
    public void delete(Integer id) {
        cartResponsitory.deleteById(id);;
    }
    public Cart getByGundam(Gundam gundam) {
        return cartResponsitory.findByGundam(gundam);
    }

}
