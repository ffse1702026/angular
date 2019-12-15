package com.infini.ccahe.responsetask.model;

import java.io.Serializable;

public class HiddenStop implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String airport;
	
	private String arrivalTime;
	
	private String arrivalDateAdjustment;
	
	private String departureTime;
	
	private String departureDateAdjustment;

	public String getAirport() {
		return airport;
	}

	public void setAirport(String airport) {
		this.airport = airport;
	}

	public String getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public String getArrivalDateAdjustment() {
		return arrivalDateAdjustment;
	}

	public void setArrivalDateAdjustment(String arrivalDateAdjustment) {
		this.arrivalDateAdjustment = arrivalDateAdjustment;
	}

	public String getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public String getDepartureDateAdjustment() {
		return departureDateAdjustment;
	}

	public void setDepartureDateAdjustment(String departureDateAdjustment) {
		this.departureDateAdjustment = departureDateAdjustment;
	}
	
}
