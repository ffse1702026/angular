package com.infini.ccahe.responsetask.model;

import java.io.Serializable;

public class Carrier implements Serializable {
	private static final long serialVersionUID = 1L;

	private String marketing;
	
	private String marketingFlightNumber;
	
	private String operating;
	
	private String operatingFlightNumber;

	public String getMarketing() {
		return marketing;
	}

	public void setMarketing(String marketing) {
		this.marketing = marketing;
	}

	public String getMarketingFlightNumber() {
		return marketingFlightNumber;
	}

	public void setMarketingFlightNumber(String marketingFlightNumber) {
		this.marketingFlightNumber = marketingFlightNumber;
	}

	public String getOperating() {
		return operating;
	}

	public void setOperating(String operating) {
		this.operating = operating;
	}

	public String getOperatingFlightNumber() {
		return operatingFlightNumber;
	}

	public void setOperatingFlightNumber(String operatingFlightNumber) {
		this.operatingFlightNumber = operatingFlightNumber;
	}
}
