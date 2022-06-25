package com.example.assignment.Entities;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "cart")
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(nullable = false)
    private BigDecimal price;
    @Column(nullable = false)
    private Integer quantity;
    @ManyToOne
    @JoinColumn(name = "customer_id",referencedColumnName = "id" )
    private Customer customer;
    @ManyToOne
    @JoinColumn(name = "gundam_id",referencedColumnName = "id" )
    private Gundam gundam;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Gundam getGundam() {
        return gundam;
    }

    public void setGundam(Gundam gundam) {
        this.gundam = gundam;
    }
}
