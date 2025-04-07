package com.example.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name = "ticketbuyer")
public class BuyTicketEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer participateUserId;
//	private Integer userId;
	private Integer seats;
	private String firstName;
	private String email;
	private String date;
	private String access;
	public Integer getParticipateUserId() {
		return participateUserId;
	}
	public void setParticipateUserId(Integer participateUserId) {
		this.participateUserId = participateUserId;
	}
//	public Integer getUserId() {
//		return userId;
//	}
//	public void setUserId(Integer userId) {
//		this.userId = userId;
//	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public String getAccess() {
		return access;
	}
	public void setAccess(String access) {
		this.access = access;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Integer getSeats() {
		return seats;
	}
	public void setSeats(Integer seats) {
		this.seats = seats;
	}
	
	
}





