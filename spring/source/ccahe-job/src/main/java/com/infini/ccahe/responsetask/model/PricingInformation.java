package com.infini.ccahe.responsetask.model;

import java.io.Serializable;
import java.util.List;

public class PricingInformation implements Serializable {
	private static final long serialVersionUID = 1L;

	private List<Fare> fares;

	public List<Fare> getFares() {
		return fares;
	}

	public void setFares(List<Fare> fares) {
		this.fares = fares;
	}
}
