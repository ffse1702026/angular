package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the rs_seg_component database table.
 * 
 */
@Entity
@Table(name="rs_seg_component")
@NamedQuery(name="RsSegComponent.findAll", query="SELECT r FROM RsSegComponent r")
public class RsSegComponent implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private RsSegComponentPK id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_time")
	private Date createdTime;

	@Column(name="departure_date")
	private String departureDate;

	private String direction;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="last_updated_time")
	private Date lastUpdatedTime;

	@Column(name="schedule_id")
	private short scheduleId;

	public RsSegComponent() {
	}

	public RsSegComponentPK getId() {
		return this.id;
	}

	public void setId(RsSegComponentPK id) {
		this.id = id;
	}

	public Date getCreatedTime() {
		return this.createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getDepartureDate() {
		return this.departureDate;
	}

	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}

	public String getDirection() {
		return this.direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public Date getLastUpdatedTime() {
		return this.lastUpdatedTime;
	}

	public void setLastUpdatedTime(Date lastUpdatedTime) {
		this.lastUpdatedTime = lastUpdatedTime;
	}

	public short getScheduleId() {
		return this.scheduleId;
	}

	public void setScheduleId(short scheduleId) {
		this.scheduleId = scheduleId;
	}

}