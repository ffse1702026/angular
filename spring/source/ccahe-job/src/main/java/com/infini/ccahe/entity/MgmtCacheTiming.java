package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the mgmt_cache_timing database table.
 * 
 */
@Entity
@Table(name="mgmt_cache_timing")
@NamedQuery(name="MgmtCacheTiming.findAll", query="SELECT m FROM MgmtCacheTiming m")
public class MgmtCacheTiming implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_time")
	private Date createdTime;

	private String fri;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="last_updated_time")
	private Date lastUpdatedTime;

	private String mon;

	@Column(name="num_of_sessions")
	private byte numOfSessions;

	private String sat;

	@Column(name="start_time_1")
	private String startTime1;

	@Column(name="start_time_2")
	private String startTime2;

	@Column(name="start_time_3")
	private String startTime3;

	private String sun;

	private String thu;

	private String tue;

	private String web;

	public MgmtCacheTiming() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getCreatedTime() {
		return this.createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getFri() {
		return this.fri;
	}

	public void setFri(String fri) {
		this.fri = fri;
	}

	public Date getLastUpdatedTime() {
		return this.lastUpdatedTime;
	}

	public void setLastUpdatedTime(Date lastUpdatedTime) {
		this.lastUpdatedTime = lastUpdatedTime;
	}

	public String getMon() {
		return this.mon;
	}

	public void setMon(String mon) {
		this.mon = mon;
	}

	public byte getNumOfSessions() {
		return this.numOfSessions;
	}

	public void setNumOfSessions(byte numOfSessions) {
		this.numOfSessions = numOfSessions;
	}

	public String getSat() {
		return this.sat;
	}

	public void setSat(String sat) {
		this.sat = sat;
	}

	public String getStartTime1() {
		return this.startTime1;
	}

	public void setStartTime1(String startTime1) {
		this.startTime1 = startTime1;
	}

	public String getStartTime2() {
		return this.startTime2;
	}

	public void setStartTime2(String startTime2) {
		this.startTime2 = startTime2;
	}

	public String getStartTime3() {
		return this.startTime3;
	}

	public void setStartTime3(String startTime3) {
		this.startTime3 = startTime3;
	}

	public String getSun() {
		return this.sun;
	}

	public void setSun(String sun) {
		this.sun = sun;
	}

	public String getThu() {
		return this.thu;
	}

	public void setThu(String thu) {
		this.thu = thu;
	}

	public String getTue() {
		return this.tue;
	}

	public void setTue(String tue) {
		this.tue = tue;
	}

	public String getWeb() {
		return this.web;
	}

	public void setWeb(String web) {
		this.web = web;
	}

}