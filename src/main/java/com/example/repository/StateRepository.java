package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Controller;

import com.example.entity.StateEntity;

@Controller
public interface StateRepository extends JpaRepository<StateEntity, Integer> {

}

