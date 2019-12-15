package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the rs_farebasis database table.
 * 
 */
@Entity
@Table(name="rs_farebasis")
@NamedQuery(name="RsFarebasi.findAll", query="SELECT r FROM RsFarebasi r")
public class RsFarebasi implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private RsFarebasiPK id;

	@Column(name="availability_break")
	private String availabilityBreak;

	private String baggage;

	private String cabin;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_time")
	private Date createdTime;

	private String farebasis;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="last_updated_time")
	private Date lastUpdatedTime;

	private String rbd;

	@Column(name="seats_available")
	private short seatsAvailable;

	public RsFarebasi() {
	}

	public RsFarebasiPK getId() {
		return this.id;
	}

	public void setId(RsFarebasiPK id) {
		this.id = id;
	}

	public String getAvailabilityBreak() {
		return this.availabilityBreak;
	}

	public void setAvailabilityBreak(String availabilityBreak) {
		this.availabilityBreak = availabilityBreak;
	}

	public String getBaggage() {
		return this.baggage;
	}

	public void setBaggage(String baggage) {
		this.baggage = baggage;
	}

	public String getCabin() {
		return this.cabin;
	}

	public void setCabin(String cabin) {
		this.cabin = cabin;
	}

	public Date getCreatedTime() {
		return this.createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getFarebasis() {
		return this.farebasis;
	}

	public void setFarebasis(String farebasis) {
		this.farebasis = farebasis;
	}

	public Date getLastUpdatedTime() {
		return this.lastUpdatedTime;
	}

	public void setLastUpdatedTime(Date lastUpdatedTime) {
		this.lastUpdatedTime = lastUpdatedTime;
	}

	public String getRbd() {
		return this.rbd;
	}

	public void setRbd(String rbd) {
		this.rbd = rbd;
	}

	public short getSeatsAvailable() {
		return this.seatsAvailable;
	}

	public void setSeatsAvailable(short seatsAvailable) {
		this.seatsAvailable = seatsAvailable;
	}

}