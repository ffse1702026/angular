package com.infini.ccahe.dto;

import java.io.Serializable;

public class BargainFinderMaxRQDto implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String patternId;

	private String binarySecurityToken;

	private String pseudoCityCode;

	private String swsUrl;
	
	private String swsMethodRequest;
	
	private String swsContentType;

	private String outboundDateFrom;

	private String outboundDateTo;
	
	private String outboundDateType;

	private String outboundTimeFrom;

	private String outboundTimeTo;
	
	private String outboundTimePosition;

	private String departureAirport;

	private String arrivalAirport;

	private String stayDay;

	private String inboundTimeFrom;

	private String inboundTimeTo;
	
	private String inboundTimePosition;

	private String carrier;

	private String stops;

	private String cabin;

	private String excludeCodeshare;

	private String freePiece;

	private String seat;

	private String numOfAdt;

	private String numOfCnn;

	private String numOfIns;

	private String numOfInf;

	public String getPatternId() {
		return patternId;
	}

	public void setPatternId(String patternId) {
		this.patternId = patternId;
	}

	public String getBinarySecurityToken() {
		return binarySecurityToken;
	}

	public void setBinarySecurityToken(String binarySecurityToken) {
		this.binarySecurityToken = binarySecurityToken;
	}

	public String getPseudoCityCode() {
		return pseudoCityCode;
	}

	public void setPseudoCityCode(String pseudoCityCode) {
		this.pseudoCityCode = pseudoCityCode;
	}

	public String getSwsUrl() {
		return swsUrl;
	}

	public void setSwsUrl(String swsUrl) {
		this.swsUrl = swsUrl;
	}

	public String getOutboundDateFrom() {
		return outboundDateFrom;
	}

	public void setOutboundDateFrom(String outboundDateFrom) {
		this.outboundDateFrom = outboundDateFrom;
	}

	public String getOutboundDateTo() {
		return outboundDateTo;
	}

	public void setOutboundDateTo(String outboundDateTo) {
		this.outboundDateTo = outboundDateTo;
	}

	public String getOutboundTimeFrom() {
		return outboundTimeFrom;
	}

	public void setOutboundTimeFrom(String outboundTimeFrom) {
		this.outboundTimeFrom = outboundTimeFrom;
	}

	public String getOutboundTimeTo() {
		return outboundTimeTo;
	}

	public void setOutboundTimeTo(String outboundTimeTo) {
		this.outboundTimeTo = outboundTimeTo;
	}

	public String getDepartureAirport() {
		return departureAirport;
	}

	public void setDepartureAirport(String departureAirport) {
		this.departureAirport = departureAirport;
	}

	public String getArrivalAirport() {
		return arrivalAirport;
	}

	public void setArrivalAirport(String arrivalAirport) {
		this.arrivalAirport = arrivalAirport;
	}

	public String getStayDay() {
		return stayDay;
	}

	public void setStayDay(String stayDay) {
		this.stayDay = stayDay;
	}

	public String getInboundTimeFrom() {
		return inboundTimeFrom;
	}

	public void setInboundTimeFrom(String inboundTimeFrom) {
		this.inboundTimeFrom = inboundTimeFrom;
	}

	public String getInboundTimeTo() {
		return inboundTimeTo;
	}

	public void setInboundTimeTo(String inboundTimeTo) {
		this.inboundTimeTo = inboundTimeTo;
	}

	public String getCarrier() {
		return carrier;
	}

	public void setCarrier(String carrier) {
		this.carrier = carrier;
	}

	public String getStops() {
		return stops;
	}

	public void setStops(String stops) {
		this.stops = stops;
	}

	public String getCabin() {
		return cabin;
	}

	public void setCabin(String cabin) {
		this.cabin = cabin;
	}

	public String getExcludeCodeshare() {
		return excludeCodeshare;
	}

	public void setExcludeCodeshare(String excludeCodeshare) {
		this.excludeCodeshare = excludeCodeshare;
	}

	public String getFreePiece() {
		return freePiece;
	}

	public void setFreePiece(String freePiece) {
		this.freePiece = freePiece;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public String getNumOfAdt() {
		return numOfAdt;
	}

	public void setNumOfAdt(String numOfAdt) {
		this.numOfAdt = numOfAdt;
	}

	public String getNumOfCnn() {
		return numOfCnn;
	}

	public void setNumOfCnn(String numOfCnn) {
		this.numOfCnn = numOfCnn;
	}

	public String getNumOfIns() {
		return numOfIns;
	}

	public void setNumOfIns(String numOfIns) {
		this.numOfIns = numOfIns;
	}

	public String getNumOfInf() {
		return numOfInf;
	}

	public void setNumOfInf(String numOfInf) {
		this.numOfInf = numOfInf;
	}

	public String getSwsMethodRequest() {
		return swsMethodRequest;
	}

	public void setSwsMethodRequest(String swsMethodRequest) {
		this.swsMethodRequest = swsMethodRequest;
	}

	public String getSwsContentType() {
		return swsContentType;
	}

	public void setSwsContentType(String swsContentType) {
		this.swsContentType = swsContentType;
	}

	public String getOutboundTimePosition() {
		return outboundTimePosition;
	}

	public void setOutboundTimePosition(String outboundTimePosition) {
		this.outboundTimePosition = outboundTimePosition;
	}

	public String getInboundTimePosition() {
		return inboundTimePosition;
	}

	public void setInboundTimePosition(String inboundTimePosition) {
		this.inboundTimePosition = inboundTimePosition;
	}

	public String getOutboundDateType() {
		return outboundDateType;
	}

	public void setOutboundDateType(String outboundDateType) {
		this.outboundDateType = outboundDateType;
	}
}
