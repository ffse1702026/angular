package com.infini.ccahe.responsetask.model;

import java.io.Serializable;

public class Penalty implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String type;
	
	private String applicability;
	
	private String amount;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getApplicability() {
		return applicability;
	}

	public void setApplicability(String applicability) {
		this.applicability = applicability;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}
}
