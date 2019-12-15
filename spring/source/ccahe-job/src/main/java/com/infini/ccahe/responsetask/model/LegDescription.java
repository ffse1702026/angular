package com.infini.ccahe.responsetask.model;

import java.io.Serializable;

public class LegDescription implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String departureDate;
	
	public String getDepartureDate() {
		return departureDate;
	}
	
	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}
	
}
