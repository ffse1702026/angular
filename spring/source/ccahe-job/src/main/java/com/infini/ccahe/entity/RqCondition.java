package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the rq_condition database table.
 * 
 */
@Entity
@Table(name="rq_condition")
@NamedQuery(name="RqCondition.findAll", query="SELECT r FROM RqCondition r")
public class RqCondition implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private RqConditionPK id;

	@Column(name="arrival_airport")
	private String arrivalAirport;

	private String cabin;

	private String carrier;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_time")
	private Date createdTime;

	@Column(name="departure_airport")
	private String departureAirport;

	@Column(name="exclude_codeshare")
	private String excludeCodeshare;

	@Column(name="free_piece")
	private String freePiece;

	@Column(name="inbound_time_from")
	private String inboundTimeFrom;

	@Column(name="inbound_time_to")
	private String inboundTimeTo;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="last_updated_time")
	private Date lastUpdatedTime;

	@Column(name="num_of_adt")
	private short numOfAdt;

	@Column(name="num_of_cnn")
	private short numOfCnn;

	@Column(name="num_of_inf")
	private short numOfInf;

	@Column(name="num_of_ins")
	private short numOfIns;

	@Column(name="outbound_date_from")
	private String outboundDateFrom;

	@Column(name="outbound_date_to")
	private String outboundDateTo;

	@Column(name="outbound_time_from")
	private String outboundTimeFrom;

	@Column(name="outbound_time_to")
	private String outboundTimeTo;

	private String rbd;

	private short staydays;

	private short stops;

	public RqCondition() {
	}

	public RqConditionPK getId() {
		return this.id;
	}

	public void setId(RqConditionPK id) {
		this.id = id;
	}

	public String getArrivalAirport() {
		return this.arrivalAirport;
	}

	public void setArrivalAirport(String arrivalAirport) {
		this.arrivalAirport = arrivalAirport;
	}

	public String getCabin() {
		return this.cabin;
	}

	public void setCabin(String cabin) {
		this.cabin = cabin;
	}

	public String getCarrier() {
		return this.carrier;
	}

	public void setCarrier(String carrier) {
		this.carrier = carrier;
	}

	public Date getCreatedTime() {
		return this.createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getDepartureAirport() {
		return this.departureAirport;
	}

	public void setDepartureAirport(String departureAirport) {
		this.departureAirport = departureAirport;
	}

	public String getExcludeCodeshare() {
		return this.excludeCodeshare;
	}

	public void setExcludeCodeshare(String excludeCodeshare) {
		this.excludeCodeshare = excludeCodeshare;
	}

	public String getFreePiece() {
		return this.freePiece;
	}

	public void setFreePiece(String freePiece) {
		this.freePiece = freePiece;
	}

	public String getInboundTimeFrom() {
		return this.inboundTimeFrom;
	}

	public void setInboundTimeFrom(String inboundTimeFrom) {
		this.inboundTimeFrom = inboundTimeFrom;
	}

	public String getInboundTimeTo() {
		return this.inboundTimeTo;
	}

	public void setInboundTimeTo(String inboundTimeTo) {
		this.inboundTimeTo = inboundTimeTo;
	}

	public Date getLastUpdatedTime() {
		return this.lastUpdatedTime;
	}

	public void setLastUpdatedTime(Date lastUpdatedTime) {
		this.lastUpdatedTime = lastUpdatedTime;
	}

	public short getNumOfAdt() {
		return this.numOfAdt;
	}

	public void setNumOfAdt(short numOfAdt) {
		this.numOfAdt = numOfAdt;
	}

	public short getNumOfCnn() {
		return this.numOfCnn;
	}

	public void setNumOfCnn(short numOfCnn) {
		this.numOfCnn = numOfCnn;
	}

	public short getNumOfInf() {
		return this.numOfInf;
	}

	public void setNumOfInf(short numOfInf) {
		this.numOfInf = numOfInf;
	}

	public short getNumOfIns() {
		return this.numOfIns;
	}

	public void setNumOfIns(short numOfIns) {
		this.numOfIns = numOfIns;
	}

	public String getOutboundDateFrom() {
		return this.outboundDateFrom;
	}

	public void setOutboundDateFrom(String outboundDateFrom) {
		this.outboundDateFrom = outboundDateFrom;
	}

	public String getOutboundDateTo() {
		return this.outboundDateTo;
	}

	public void setOutboundDateTo(String outboundDateTo) {
		this.outboundDateTo = outboundDateTo;
	}

	public String getOutboundTimeFrom() {
		return this.outboundTimeFrom;
	}

	public void setOutboundTimeFrom(String outboundTimeFrom) {
		this.outboundTimeFrom = outboundTimeFrom;
	}

	public String getOutboundTimeTo() {
		return this.outboundTimeTo;
	}

	public void setOutboundTimeTo(String outboundTimeTo) {
		this.outboundTimeTo = outboundTimeTo;
	}

	public String getRbd() {
		return this.rbd;
	}

	public void setRbd(String rbd) {
		this.rbd = rbd;
	}

	public short getStaydays() {
		return this.staydays;
	}

	public void setStaydays(short staydays) {
		this.staydays = staydays;
	}

	public short getStops() {
		return this.stops;
	}

	public void setStops(short stops) {
		this.stops = stops;
	}

}