package com.infini.ccahe.responsetask.model;

import java.io.Serializable;
import java.util.List;

public class PassengerInfo implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String passengerType;
	
	private String nonRefundable;
	
	private List<FareComponent> fareComponents;
	
	private List<Tax> taxs;
	
	private List<FareMessage> fareMessages;
	
	private List<PassengerTotalFare> passengerTotalFares;
	
	private List<BaggageInformation> baggageInformations;
	
	private List<PenaltiesInfo> penaltiesInfos;

	public String getPassengerType() {
		return passengerType;
	}

	public void setPassengerType(String passengerType) {
		this.passengerType = passengerType;
	}

	public String getNonRefundable() {
		return nonRefundable;
	}

	public void setNonRefundable(String nonRefundable) {
		this.nonRefundable = nonRefundable;
	}

	public List<FareComponent> getFareComponents() {
		return fareComponents;
	}

	public void setFareComponents(List<FareComponent> fareComponents) {
		this.fareComponents = fareComponents;
	}

	public List<Tax> getTaxs() {
		return taxs;
	}

	public void setTaxs(List<Tax> taxs) {
		this.taxs = taxs;
	}

	public List<FareMessage> getFareMessages() {
		return fareMessages;
	}

	public void setFareMessages(List<FareMessage> fareMessages) {
		this.fareMessages = fareMessages;
	}

	public List<PassengerTotalFare> getPassengerTotalFares() {
		return passengerTotalFares;
	}

	public void setPassengerTotalFares(List<PassengerTotalFare> passengerTotalFares) {
		this.passengerTotalFares = passengerTotalFares;
	}

	public List<BaggageInformation> getBaggageInformations() {
		return baggageInformations;
	}

	public void setBaggageInformations(List<BaggageInformation> baggageInformations) {
		this.baggageInformations = baggageInformations;
	}

	public List<PenaltiesInfo> getPenaltiesInfos() {
		return penaltiesInfos;
	}

	public void setPenaltiesInfos(List<PenaltiesInfo> penaltiesInfos) {
		this.penaltiesInfos = penaltiesInfos;
	}
}
