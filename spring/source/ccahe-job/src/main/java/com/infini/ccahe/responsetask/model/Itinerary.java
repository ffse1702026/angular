package com.infini.ccahe.responsetask.model;

import java.io.Serializable;
import java.util.List;

public class Itinerary implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private List<Leg> legs;
	
	private List<PricingInformation> pricingInformations;

	public List<Leg> getLegs() {
		return legs;
	}

	public void setLegs(List<Leg> legs) {
		this.legs = legs;
	}

	public List<PricingInformation> getPricingInformations() {
		return pricingInformations;
	}

	public void setPricingInformations(List<PricingInformation> pricingInformations) {
		this.pricingInformations = pricingInformations;
	}
}
