package com.infini.ccahe.responsetask.model;

import java.io.Serializable;

public class PassengerTotalFare implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String totalFare;
	
	private String totalTaxes;
	
	private String equivalentAmount;

	public String getTotalFare() {
		return totalFare;
	}

	public void setTotalFare(String totalFare) {
		this.totalFare = totalFare;
	}

	public String getTotalTaxes() {
		return totalTaxes;
	}

	public void setTotalTaxes(String totalTaxes) {
		this.totalTaxes = totalTaxes;
	}

	public String getEquivalentAmount() {
		return equivalentAmount;
	}

	public void setEquivalentAmount(String equivalentAmount) {
		this.equivalentAmount = equivalentAmount;
	}
}
