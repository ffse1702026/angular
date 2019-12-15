package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the rs_segment database table.
 * 
 */
@Entity
@Table(name="rs_segment")
@NamedQuery(name="RsSegment.findAll", query="SELECT r FROM RsSegment r")
public class RsSegment implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private RsSegmentPK id;

	@Column(name="arrival_airport")
	private String arrivalAirport;

	@Column(name="arrival_time")
	private String arrivalTime;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_time")
	private Date createdTime;

	@Column(name="date_adjustment")
	private short dateAdjustment;

	@Column(name="departure_airport")
	private String departureAirport;

	@Column(name="departure_time")
	private String departureTime;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="last_updated_time")
	private Date lastUpdatedTime;

	@Column(name="marketing_carrier")
	private String marketingCarrier;

	@Column(name="marketing_flight_number")
	private String marketingFlightNumber;

	@Column(name="operating_carrier")
	private String operatingCarrier;

	@Column(name="operating_flight_number")
	private String operatingFlightNumber;

	private short stops;

	public RsSegment() {
	}

	public RsSegmentPK getId() {
		return this.id;
	}

	public void setId(RsSegmentPK id) {
		this.id = id;
	}

	public String getArrivalAirport() {
		return this.arrivalAirport;
	}

	public void setArrivalAirport(String arrivalAirport) {
		this.arrivalAirport = arrivalAirport;
	}

	public String getArrivalTime() {
		return this.arrivalTime;
	}

	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public Date getCreatedTime() {
		return this.createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public short getDateAdjustment() {
		return this.dateAdjustment;
	}

	public void setDateAdjustment(short dateAdjustment) {
		this.dateAdjustment = dateAdjustment;
	}

	public String getDepartureAirport() {
		return this.departureAirport;
	}

	public void setDepartureAirport(String departureAirport) {
		this.departureAirport = departureAirport;
	}

	public String getDepartureTime() {
		return this.departureTime;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public Date getLastUpdatedTime() {
		return this.lastUpdatedTime;
	}

	public void setLastUpdatedTime(Date lastUpdatedTime) {
		this.lastUpdatedTime = lastUpdatedTime;
	}

	public String getMarketingCarrier() {
		return this.marketingCarrier;
	}

	public void setMarketingCarrier(String marketingCarrier) {
		this.marketingCarrier = marketingCarrier;
	}

	public String getMarketingFlightNumber() {
		return this.marketingFlightNumber;
	}

	public void setMarketingFlightNumber(String marketingFlightNumber) {
		this.marketingFlightNumber = marketingFlightNumber;
	}

	public String getOperatingCarrier() {
		return this.operatingCarrier;
	}

	public void setOperatingCarrier(String operatingCarrier) {
		this.operatingCarrier = operatingCarrier;
	}

	public String getOperatingFlightNumber() {
		return this.operatingFlightNumber;
	}

	public void setOperatingFlightNumber(String operatingFlightNumber) {
		this.operatingFlightNumber = operatingFlightNumber;
	}

	public short getStops() {
		return this.stops;
	}

	public void setStops(short stops) {
		this.stops = stops;
	}

}