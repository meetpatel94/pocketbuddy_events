package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entity.EventTypeEntity;

public interface EventRepository extends JpaRepository<EventTypeEntity, Integer>{

}
