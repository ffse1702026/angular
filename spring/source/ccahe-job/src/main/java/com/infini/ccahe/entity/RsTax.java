package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the rs_tax database table.
 * 
 */
@Entity
@Table(name="rs_tax")
@NamedQuery(name="RsTax.findAll", query="SELECT r FROM RsTax r")
public class RsTax implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private RsTaxPK id;

	private String amount;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_time")
	private Date createdTime;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="last_updated_time")
	private Date lastUpdatedTime;

	public RsTax() {
	}

	public RsTaxPK getId() {
		return this.id;
	}

	public void setId(RsTaxPK id) {
		this.id = id;
	}

	public String getAmount() {
		return this.amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public Date getCreatedTime() {
		return this.createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public Date getLastUpdatedTime() {
		return this.lastUpdatedTime;
	}

	public void setLastUpdatedTime(Date lastUpdatedTime) {
		this.lastUpdatedTime = lastUpdatedTime;
	}

}