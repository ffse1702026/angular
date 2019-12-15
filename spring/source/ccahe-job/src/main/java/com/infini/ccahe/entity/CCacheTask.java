package com.infini.ccahe.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;

@Entity
public class CCacheTask implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@EmbeddedId
	private CCacheTaskPK id;

	@Column(name = "departure_airport")
	private String departureAirport;

	@Column(name = "arrival_airport")
	private String arrivalAirport;

	@Column(name = "carrier")
	private String carrier;

	@Column(name = "outbound_date_from")
	private short outboundDateFrom;

	@Column(name = "outbound_date_to")
	private short outboundDateTo;

	@Column(name = "outbound_time_from")
	private String outboundTimeFrom;

	@Column(name = "outbound_time_to")
	private String outboundTimeTo;

	@Column(name = "inbound_time_from")
	private String inboundTimeFrom;

	@Column(name = "inbound_time_to")
	private String inboundTimeTo;

	@Column(name = "num_of_adt")
	private short numOfAdt;

	@Column(name = "num_of_cnn")
	private short numOfCnn;

	@Column(name = "num_of_ins")
	private short numOfIns;

	@Column(name = "num_of_inf")
	private short numOfInf;

	@Column(name = "stops")
	private short stops;

	@Column(name = "rbd")
	private String rbd;

	@Column(name = "exclude_codeshare")
	private byte excludeCodeshare;

	@Column(name = "free_piece")
	private byte freePiece;

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

	public String getCarrier() {
		return carrier;
	}

	public void setCarrier(String carrier) {
		this.carrier = carrier;
	}

	public short getOutboundDateFrom() {
		return outboundDateFrom;
	}

	public void setOutboundDateFrom(short outboundDateFrom) {
		this.outboundDateFrom = outboundDateFrom;
	}

	public short getOutboundDateTo() {
		return outboundDateTo;
	}

	public void setOutboundDateTo(short outboundDateTo) {
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

	public short getNumOfAdt() {
		return numOfAdt;
	}

	public void setNumOfAdt(short numOfAdt) {
		this.numOfAdt = numOfAdt;
	}

	public short getNumOfCnn() {
		return numOfCnn;
	}

	public void setNumOfCnn(short numOfCnn) {
		this.numOfCnn = numOfCnn;
	}

	public short getNumOfIns() {
		return numOfIns;
	}

	public void setNumOfIns(short numOfIns) {
		this.numOfIns = numOfIns;
	}

	public short getNumOfInf() {
		return numOfInf;
	}

	public void setNumOfInf(short numOfInf) {
		this.numOfInf = numOfInf;
	}

	public short getStops() {
		return stops;
	}

	public void setStops(short stops) {
		this.stops = stops;
	}

	public String getRbd() {
		return rbd;
	}

	public void setRbd(String rbd) {
		this.rbd = rbd;
	}

	public byte getExcludeCodeshare() {
		return excludeCodeshare;
	}

	public void setExcludeCodeshare(byte excludeCodeshare) {
		this.excludeCodeshare = excludeCodeshare;
	}

	public byte getFreePiece() {
		return freePiece;
	}

	public void setFreePiece(byte freePiece) {
		this.freePiece = freePiece;
	}

	public CCacheTaskPK getId() {
		return id;
	}

	public void setId(CCacheTaskPK id) {
		this.id = id;
	}
}
