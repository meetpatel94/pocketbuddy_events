package com.example.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name = "createevent")
public class CreateEventsEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer createeventId;
	private String eventType;
	private String title;
	private String profilePicPath;
	private String keynote;
	private String date;
	private String state;
	private String city;
	private String stime;
	private String etime;
	private String description;
	private String name;
	private String address;
	
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getEtime() {
		return etime;
	}
	public void setEtime(String etime) {
		this.etime = etime;
	}
	public Integer getCreateeventId() {
		return createeventId;
	}
	public void setCreateeventId(Integer createeventId) {
		this.createeventId = createeventId;
	}
	public String getEventType() {
		return eventType;
	}
	public void setEventType(String eventType) {
		this.eventType = eventType;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getKeynote() {
		return keynote;
	}
	public void setKeynote(String keynote) {
		this.keynote = keynote;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getProfilePicPath() {
		return profilePicPath;
	}
	public void setProfilePicPath(String profilePicPath) {
		this.profilePicPath = profilePicPath;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	

	
}






