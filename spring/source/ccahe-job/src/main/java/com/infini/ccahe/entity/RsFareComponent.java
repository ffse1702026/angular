package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the rs_fare_component database table.
 * 
 */
@Entity
@Table(name="rs_fare_component")
@NamedQuery(name="RsFareComponent.findAll", query="SELECT r FROM RsFareComponent r")
public class RsFareComponent implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private RsFareComponentPK id;

	private String baggage;

	@Column(name="base_fare")
	private int baseFare;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_time")
	private Date createdTime;

	@Column(name="exchange_after")
	private int exchangeAfter;

	@Column(name="exchange_before")
	private int exchangeBefore;

	@Column(name="last_ticket_date")
	private String lastTicketDate;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="last_updated_time")
	private Date lastUpdatedTime;

	@Column(name="non_refundable")
	private String nonRefundable;

	@Column(name="refund_after")
	private int refundAfter;

	@Column(name="refund_before")
	private int refundBefore;

	@Column(name="total_fare")
	private int totalFare;

	@Column(name="total_tax")
	private int totalTax;

	@Column(name="validating_carrier")
	private String validatingCarrier;

	public RsFareComponent() {
	}

	public RsFareComponentPK getId() {
		return this.id;
	}

	public void setId(RsFareComponentPK id) {
		this.id = id;
	}

	public String getBaggage() {
		return this.baggage;
	}

	public void setBaggage(String baggage) {
		this.baggage = baggage;
	}

	public int getBaseFare() {
		return this.baseFare;
	}

	public void setBaseFare(int baseFare) {
		this.baseFare = baseFare;
	}

	public Date getCreatedTime() {
		return this.createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public int getExchangeAfter() {
		return this.exchangeAfter;
	}

	public void setExchangeAfter(int exchangeAfter) {
		this.exchangeAfter = exchangeAfter;
	}

	public int getExchangeBefore() {
		return this.exchangeBefore;
	}

	public void setExchangeBefore(int exchangeBefore) {
		this.exchangeBefore = exchangeBefore;
	}

	public String getLastTicketDate() {
		return this.lastTicketDate;
	}

	public void setLastTicketDate(String lastTicketDate) {
		this.lastTicketDate = lastTicketDate;
	}

	public Date getLastUpdatedTime() {
		return this.lastUpdatedTime;
	}

	public void setLastUpdatedTime(Date lastUpdatedTime) {
		this.lastUpdatedTime = lastUpdatedTime;
	}

	public String getNonRefundable() {
		return this.nonRefundable;
	}

	public void setNonRefundable(String nonRefundable) {
		this.nonRefundable = nonRefundable;
	}

	public int getRefundAfter() {
		return this.refundAfter;
	}

	public void setRefundAfter(int refundAfter) {
		this.refundAfter = refundAfter;
	}

	public int getRefundBefore() {
		return this.refundBefore;
	}

	public void setRefundBefore(int refundBefore) {
		this.refundBefore = refundBefore;
	}

	public int getTotalFare() {
		return this.totalFare;
	}

	public void setTotalFare(int totalFare) {
		this.totalFare = totalFare;
	}

	public int getTotalTax() {
		return this.totalTax;
	}

	public void setTotalTax(int totalTax) {
		this.totalTax = totalTax;
	}

	public String getValidatingCarrier() {
		return this.validatingCarrier;
	}

	public void setValidatingCarrier(String validatingCarrier) {
		this.validatingCarrier = validatingCarrier;
	}

}