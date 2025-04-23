package com.example.entity;

import java.time.LocalDate;
import java.time.LocalTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "comment")
public class CommentEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
//	private Integer userId;
	private Integer commentUserId;
	private String name;
	private LocalDate date;
	private LocalTime time;
	private String email;
	private String subject;
	private String message;
	
//	public Integer getUserId() {
//		return userId;
//	}
//	public void setUserId(Integer userId) {
//		this.userId = userId;
//	}
	public Integer getCommentUserId() {
		return commentUserId;
	}
	public void setCommentUserId(Integer commentUserId) {
		this.commentUserId = commentUserId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public LocalTime getTime() {
		return time;
	}
	public void setTime(LocalTime time) {
		this.time = time;
	}
	

}
