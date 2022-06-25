package com.example.assignment.Service;

import com.example.assignment.Entities.Customer;
import com.example.assignment.Repository.ICustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerService {
    @Autowired
    private ICustomerRepository customerResponsitory;

    public Customer add(Customer customer) {
        return customerResponsitory.save(customer);
    }
    public Customer findByEmail(String email) {
        return customerResponsitory.findByEmail(email);
    }
}
