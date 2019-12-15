package com.infini.ccahe.responsetask.model;

import java.io.Serializable;

public class Schedule implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String ref;
	
	private String departureDateAdjustment;
	
	private String requestedStoppover;

	public String getRef() {
		return ref;
	}

	public void setRef(String ref) {
		this.ref = ref;
	}

	public String getDepartureDateAdjustment() {
		return departureDateAdjustment;
	}

	public void setDepartureDateAdjustment(String departureDateAdjustment) {
		this.departureDateAdjustment = departureDateAdjustment;
	}

	public String getRequestedStoppover() {
		return requestedStoppover;
	}

	public void setRequestedStoppover(String requestedStoppover) {
		this.requestedStoppover = requestedStoppover;
	}
}
