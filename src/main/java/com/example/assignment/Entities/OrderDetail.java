package com.example.assignment.Entities;
import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "orderdetail")
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(nullable = false)
    private BigDecimal price;
    @Column(nullable = false)
    private Integer quantity;
    @ManyToOne
    @JoinColumn(name = "order_id",referencedColumnName = "id")
    private Order order;
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

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Gundam getGundam() {
        return gundam;
    }

    public void setGundam(Gundam gundam) {
        this.gundam = gundam;
    }
}
