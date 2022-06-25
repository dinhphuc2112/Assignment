package com.example.assignment.Repository;

import com.example.assignment.Entities.Gundam;
import com.example.assignment.Entities.Type;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface IGundamRepository extends JpaRepository<Gundam, Integer> {
    List<Gundam> findByType(Type type);
    @Query("SELECT c FROM Gundam c WHERE c.name like ?1")
    List<Gundam> findByNameLike(String name);
    @Query("SELECT c FROM Gundam c WHERE c.name like ?1 and c.type=?2")
    List<Gundam> findByNameLikeAndType(String name,Type type);
}
