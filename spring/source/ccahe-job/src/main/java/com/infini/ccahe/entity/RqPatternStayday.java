package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the rq_pattern_staydays database table.
 * 
 */
@Entity
@Table(name="rq_pattern_staydays")
@NamedQuery(name="RqPatternStayday.findAll", query="SELECT r FROM RqPatternStayday r")
public class RqPatternStayday implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private short position;

	@Column(name="stay_day")
	private short stayDay;

	//bi-directional many-to-one association to RqPattern
	@ManyToOne
	@JoinColumn(name="pattern_id")
	private RqPattern rqPattern;

	public RqPatternStayday() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public short getPosition() {
		return this.position;
	}

	public void setPosition(short position) {
		this.position = position;
	}

	public short getStayDay() {
		return this.stayDay;
	}

	public void setStayDay(short stayDay) {
		this.stayDay = stayDay;
	}

	public RqPattern getRqPattern() {
		return this.rqPattern;
	}

	public void setRqPattern(RqPattern rqPattern) {
		this.rqPattern = rqPattern;
	}

}