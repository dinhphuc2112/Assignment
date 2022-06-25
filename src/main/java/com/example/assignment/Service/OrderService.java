package com.example.assignment.Service;

import com.example.assignment.Entities.Order;
import com.example.assignment.Repository.IOrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {
    @Autowired
    public IOrderRepository oderResponsitory;

    public Order add(Order order) {
        return oderResponsitory.save(order);
    }
    public List<Order> list(){
        return oderResponsitory.findAll();
    }

    public Order getId(Integer id) {
        Optional<Order> optional = oderResponsitory.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        }else {
            return null ;
        }
    }
}
