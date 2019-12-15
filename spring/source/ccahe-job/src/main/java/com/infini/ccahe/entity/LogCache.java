package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the log_cache database table.
 * 
 */
@Entity
@Table(name="log_cache")
@NamedQuery(name="LogCache.findAll", query="SELECT l FROM LogCache l")
public class LogCache implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	@Column(name="arrival_airport")
	private String arrivalAirport;

	private String cabin;

	@Column(name="cache_result")
	private String cacheResult;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="cache_time")
	private Date cacheTime;

	private String carrier;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_time")
	private Date createdTime;

	@Column(name="departure_airport")
	private String departureAirport;

	private short duration;

	@Lob
	@Column(name="error_msg")
	private String errorMsg;

	@Column(name="exclude_codeshare")
	private short excludeCodeshare;

	@Column(name="inbound_time")
	private String inboundTime;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="last_updated_time")
	private Date lastUpdatedTime;

	@Column(name="outbound_date_from")
	private String outboundDateFrom;

	@Column(name="outbound_date_to")
	private String outboundDateTo;

	@Column(name="outbound_time")
	private String outboundTime;

	@Column(name="pattern_id")
	private String patternId;

	@Column(name="request_id")
	private String requestId;

	@Lob
	@Column(name="request_xml")
	private String requestXml;

	@Lob
	@Column(name="response_xml")
	private String responseXml;

	private short stops;

	public LogCache() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
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

	public String getCacheResult() {
		return this.cacheResult;
	}

	public void setCacheResult(String cacheResult) {
		this.cacheResult = cacheResult;
	}

	public Date getCacheTime() {
		return this.cacheTime;
	}

	public void setCacheTime(Date cacheTime) {
		this.cacheTime = cacheTime;
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

	public short getDuration() {
		return this.duration;
	}

	public void setDuration(short duration) {
		this.duration = duration;
	}

	public String getErrorMsg() {
		return this.errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public short getExcludeCodeshare() {
		return this.excludeCodeshare;
	}

	public void setExcludeCodeshare(short excludeCodeshare) {
		this.excludeCodeshare = excludeCodeshare;
	}

	public String getInboundTime() {
		return this.inboundTime;
	}

	public void setInboundTime(String inboundTime) {
		this.inboundTime = inboundTime;
	}

	public Date getLastUpdatedTime() {
		return this.lastUpdatedTime;
	}

	public void setLastUpdatedTime(Date lastUpdatedTime) {
		this.lastUpdatedTime = lastUpdatedTime;
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

	public String getOutboundTime() {
		return this.outboundTime;
	}

	public void setOutboundTime(String outboundTime) {
		this.outboundTime = outboundTime;
	}

	public String getPatternId() {
		return this.patternId;
	}

	public void setPatternId(String patternId) {
		this.patternId = patternId;
	}

	public String getRequestId() {
		return this.requestId;
	}

	public void setRequestId(String requestId) {
		this.requestId = requestId;
	}

	public String getRequestXml() {
		return this.requestXml;
	}

	public void setRequestXml(String requestXml) {
		this.requestXml = requestXml;
	}

	public String getResponseXml() {
		return this.responseXml;
	}

	public void setResponseXml(String responseXml) {
		this.responseXml = responseXml;
	}

	public short getStops() {
		return this.stops;
	}

	public void setStops(short stops) {
		this.stops = stops;
	}

}