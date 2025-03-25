package com.example.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.entity.RatingEntity;

@Repository
public interface RatingRepository extends JpaRepository<RatingEntity, Integer>{

	
	@Query(value="select r.* , u.first_name , u.email from users u , rating r where r.user_id = u.user_id",nativeQuery = true)
	List<Object[]> getAll();

	@Query(value = "select r.* , u.first_name , u.email from users u , rating r where r.user_id = u.user_id and r.rating_user_id = :rating_user_id", nativeQuery = true)
	List<Object[]> getByRatingUserId(Integer ratingUserId);
			
}

