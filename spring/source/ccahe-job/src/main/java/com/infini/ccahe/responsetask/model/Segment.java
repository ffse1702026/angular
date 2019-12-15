package com.infini.ccahe.responsetask.model;

import java.io.Serializable;

public class Segment implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String id;
	
	private String bookingCode;
	
	private String cabinCode;
	
	private String seatsAvailable;
	
	private String availabilityBreak;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBookingCode() {
		return bookingCode;
	}

	public void setBookingCode(String bookingCode) {
		this.bookingCode = bookingCode;
	}

	public String getCabinCode() {
		return cabinCode;
	}

	public void setCabinCode(String cabinCode) {
		this.cabinCode = cabinCode;
	}

	public String getSeatsAvailable() {
		return seatsAvailable;
	}

	public void setSeatsAvailable(String seatsAvailable) {
		this.seatsAvailable = seatsAvailable;
	}

	public String getAvailabilityBreak() {
		return availabilityBreak;
	}

	public void setAvailabilityBreak(String availabilityBreak) {
		this.availabilityBreak = availabilityBreak;
	}
}
