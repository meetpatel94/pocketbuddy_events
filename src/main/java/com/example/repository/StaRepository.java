package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entity.StaEntity;

public interface StaRepository extends JpaRepository<StaEntity, Integer> {

}
