package com.example.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "sta")
public class StaEntity {

	@Id
	@GeneratedValue
	private Integer staId;
	private String StaName;
	public Integer getStaId() {
		return staId;
	}
	public void setStaId(Integer staId) {
		this.staId = staId;
	}
	public String getStaName() {
		return StaName;
	}
	public void setStaName(String staName) {
		StaName = staName;
	}
}
