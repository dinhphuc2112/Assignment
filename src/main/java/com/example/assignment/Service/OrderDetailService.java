package com.example.assignment.Service;

import com.example.assignment.Entities.Order;
import com.example.assignment.Entities.OrderDetail;
import com.example.assignment.Repository.IOrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderDetailService {
    @Autowired
    public IOrderDetailRepository orderDetailResponsitory;

    public OrderDetail add(OrderDetail orderDetail) {
        return orderDetailResponsitory.save(orderDetail);
    }
    public List<OrderDetail> listOrderDetail(Order order){
        return orderDetailResponsitory.findByOrder(order);
    }
}
