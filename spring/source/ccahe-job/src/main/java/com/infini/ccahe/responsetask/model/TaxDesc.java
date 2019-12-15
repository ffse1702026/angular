package com.infini.ccahe.responsetask.model;

import java.io.Serializable;

public class TaxDesc implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String id;
	
	private String code;
	
	private String amount;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

}
