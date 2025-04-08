package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.entity.CreateEventsEntity;

@Repository
public interface CreateEventsRepository extends JpaRepository<CreateEventsEntity, Integer> {

}
