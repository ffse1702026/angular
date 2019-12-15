package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the rq_pattern_inboundtime database table.
 * 
 */
@Entity
@Table(name="rq_pattern_inboundtime")
@NamedQuery(name="RqPatternInboundtime.findAll", query="SELECT r FROM RqPatternInboundtime r")
public class RqPatternInboundtime implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String from;

	private String position;

	private String to;

	//bi-directional many-to-one association to RqPattern
	@ManyToOne
	@JoinColumn(name="pattern_id")
	private RqPattern rqPattern;

	public RqPatternInboundtime() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFrom() {
		return this.from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getTo() {
		return this.to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public RqPattern getRqPattern() {
		return this.rqPattern;
	}

	public void setRqPattern(RqPattern rqPattern) {
		this.rqPattern = rqPattern;
	}

}