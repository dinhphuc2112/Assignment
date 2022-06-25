package com.example.assignment.Repository;

import com.example.assignment.Entities.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ICustomerRepository extends JpaRepository<Customer, Integer> {
    @Query("select o from Customer o where o.email = :email")
    public Customer findByEmail(@Param("email") String email);
}
