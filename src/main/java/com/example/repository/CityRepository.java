package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.entity.CityEntity;



@Repository
public interface CityRepository extends JpaRepository<CityEntity, Integer> {
     
}

