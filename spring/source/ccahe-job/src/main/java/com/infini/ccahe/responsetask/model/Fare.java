package com.infini.ccahe.responsetask.model;

import java.io.Serializable;
import java.util.List;

public class Fare implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String validatingCarrierCode;
	
	private String lastTicketDate;
	
	private List<PassengerInfo> passengerInfos;

	public String getValidatingCarrierCode() {
		return validatingCarrierCode;
	}

	public void setValidatingCarrierCode(String validatingCarrierCode) {
		this.validatingCarrierCode = validatingCarrierCode;
	}

	public List<PassengerInfo> getPassengerInfos() {
		return passengerInfos;
	}

	public void setPassengerInfos(List<PassengerInfo> passengerInfos) {
		this.passengerInfos = passengerInfos;
	}

	public String getLastTicketDate() {
		return lastTicketDate;
	}

	public void setLastTicketDate(String lastTicketDate) {
		this.lastTicketDate = lastTicketDate;
	}

}
