package com.example.entity;

import jakarta.persistence.Entity;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "rating")
public class RatingEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ratingUserId;
	private Integer userId;
	private String exp;
	private Integer rating;
	private String description;

	public Integer getRatingUserId() {
		return ratingUserId;
	}
	public void setRatingUserId(Integer ratingUserId) {
		this.ratingUserId = ratingUserId;
	}
	public Integer getRating() {
		return rating;
	}
	public void setRating(Integer rating) {
		this.rating = rating;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getExp() {
		return exp;
	}
	public void setExp(String exp) {
		this.exp = exp;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
}
