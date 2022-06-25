package com.example.assignment.Service;

import com.example.assignment.Entities.Gundam;
import com.example.assignment.Repository.IGundamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class GundamService {
    @Autowired
    public IGundamRepository gundamResponsitory;

    public Gundam add(Gundam gundam) {
        return gundamResponsitory.save(gundam);
    }
    public Gundam findById(Integer id) {
        Optional<Gundam> optional = gundamResponsitory.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        }else {
            return null;
        }
    }
    public Gundam update(Integer id,Gundam gundam) {
        Optional<Gundam> optional = gundamResponsitory.findById(id);
        if(optional.isPresent()) {
           Gundam w = optional.get();
            if(gundam.getPhoto()=="") gundam.setPhoto(w.getPhoto());
            return gundamResponsitory.save(gundam);
        }
        return null;
    }
    public void delete(Integer id) {
        gundamResponsitory.deleteById(id);
    }
    public List<Gundam> getByName(String name) {
        return gundamResponsitory.findByNameLike("%" + name + "%");
    }
}
