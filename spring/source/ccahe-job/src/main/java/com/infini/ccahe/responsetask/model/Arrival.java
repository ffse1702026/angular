package com.infini.ccahe.responsetask.model;

import java.io.Serializable;

public class Arrival implements Serializable {
	private static final long serialVersionUID = 1L;

	private String airport;
	
	private String time;
	
	private String dateAdjustment;

	public String getAirport() {
		return airport;
	}

	public void setAirport(String airport) {
		this.airport = airport;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDateAdjustment() {
		return dateAdjustment;
	}

	public void setDateAdjustment(String dateAdjustment) {
		this.dateAdjustment = dateAdjustment;
	}
	
	
}
