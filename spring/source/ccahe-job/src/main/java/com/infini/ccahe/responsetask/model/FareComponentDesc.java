package com.infini.ccahe.responsetask.model;

import java.io.Serializable;

public class FareComponentDesc implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String id;
	
	private String fareBasisCode;
	
	private String farePassengerType;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFareBasisCode() {
		return fareBasisCode;
	}

	public void setFareBasisCode(String fareBasisCode) {
		this.fareBasisCode = fareBasisCode;
	}

	public String getFarePassengerType() {
		return farePassengerType;
	}

	public void setFarePassengerType(String farePassengerType) {
		this.farePassengerType = farePassengerType;
	}
}
