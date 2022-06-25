package com.example.assignment.Repository;

import com.example.assignment.Entities.Cart;
import com.example.assignment.Entities.Gundam;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ICartRepository extends JpaRepository<Cart, Integer> {
    @Query("select o from Cart o where o.gundam=?1")
    Cart findByGundam(Gundam gundam);

}
