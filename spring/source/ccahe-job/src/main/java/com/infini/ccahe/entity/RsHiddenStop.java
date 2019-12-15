package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the rs_hidden_stop database table.
 * 
 */
@Entity
@Table(name="rs_hidden_stop")
@NamedQuery(name="RsHiddenStop.findAll", query="SELECT r FROM RsHiddenStop r")
public class RsHiddenStop implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private RsHiddenStopPK id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_time")
	private Date createdTime;

	@Column(name="hidden_stop_airport")
	private String hiddenStopAirport;

	@Column(name="hidden_stop_arrival_date_adjustment")
	private short hiddenStopArrivalDateAdjustment;

	@Column(name="hidden_stop_arrival_time")
	private String hiddenStopArrivalTime;

	@Column(name="hidden_stop_departure_date_adjustment")
	private short hiddenStopDepartureDateAdjustment;

	@Column(name="hidden_stop_departure_time")
	private String hiddenStopDepartureTime;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="last_updated_time")
	private Date lastUpdatedTime;

	public RsHiddenStop() {
	}

	public RsHiddenStopPK getId() {
		return this.id;
	}

	public void setId(RsHiddenStopPK id) {
		this.id = id;
	}

	public Date getCreatedTime() {
		return this.createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getHiddenStopAirport() {
		return this.hiddenStopAirport;
	}

	public void setHiddenStopAirport(String hiddenStopAirport) {
		this.hiddenStopAirport = hiddenStopAirport;
	}

	public short getHiddenStopArrivalDateAdjustment() {
		return this.hiddenStopArrivalDateAdjustment;
	}

	public void setHiddenStopArrivalDateAdjustment(short hiddenStopArrivalDateAdjustment) {
		this.hiddenStopArrivalDateAdjustment = hiddenStopArrivalDateAdjustment;
	}

	public String getHiddenStopArrivalTime() {
		return this.hiddenStopArrivalTime;
	}

	public void setHiddenStopArrivalTime(String hiddenStopArrivalTime) {
		this.hiddenStopArrivalTime = hiddenStopArrivalTime;
	}

	public short getHiddenStopDepartureDateAdjustment() {
		return this.hiddenStopDepartureDateAdjustment;
	}

	public void setHiddenStopDepartureDateAdjustment(short hiddenStopDepartureDateAdjustment) {
		this.hiddenStopDepartureDateAdjustment = hiddenStopDepartureDateAdjustment;
	}

	public String getHiddenStopDepartureTime() {
		return this.hiddenStopDepartureTime;
	}

	public void setHiddenStopDepartureTime(String hiddenStopDepartureTime) {
		this.hiddenStopDepartureTime = hiddenStopDepartureTime;
	}

	public Date getLastUpdatedTime() {
		return this.lastUpdatedTime;
	}

	public void setLastUpdatedTime(Date lastUpdatedTime) {
		this.lastUpdatedTime = lastUpdatedTime;
	}

}