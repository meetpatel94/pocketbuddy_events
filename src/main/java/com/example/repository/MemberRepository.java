package com.example.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.entity.MemberEntity;
import com.example.entity.UserEntity;

@Repository
public interface MemberRepository extends JpaRepository<MemberEntity, Integer>{

	List<MemberEntity> findByRole(String role);
	
}




