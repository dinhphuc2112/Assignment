package com.example.assignment.Repository;

import com.example.assignment.Entities.Order;
import com.example.assignment.Entities.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IOrderDetailRepository extends JpaRepository<OrderDetail, Integer> {
    List<OrderDetail> findByOrder(Order order);
}
