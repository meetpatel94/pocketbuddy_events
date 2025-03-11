package com.example.entity;

import jakarta.persistence.Entity; 
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity //for create table
@Table(name = "state")  //for set a table name
public class StateEntity {
	
	
	@Id  //for primary key
	@GeneratedValue
	private Integer userId;//primary key 
    private String stateName;
    private Integer stateId;
	public String getStateName() {
		return stateName;
	}
	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	public Integer getStateId() {
		return stateId;
	}
	public void setStateId(Integer stateId) {
		this.stateId = stateId;
	}

	
}

