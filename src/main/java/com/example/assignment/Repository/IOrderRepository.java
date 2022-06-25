package com.example.assignment.Repository;

import com.example.assignment.Entities.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IOrderRepository extends JpaRepository<Order, Integer> {
}
