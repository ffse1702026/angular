package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the rq_pattern_cabin database table.
 * 
 */
@Entity
@Table(name="rq_pattern_cabin")
@NamedQuery(name="RqPatternCabin.findAll", query="SELECT r FROM RqPatternCabin r")
public class RqPatternCabin implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String cabin;

	//bi-directional many-to-one association to RqPattern
	@ManyToOne
	@JoinColumn(name="pattern_id")
	private RqPattern rqPattern;

	public RqPatternCabin() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCabin() {
		return this.cabin;
	}

	public void setCabin(String cabin) {
		this.cabin = cabin;
	}

	public RqPattern getRqPattern() {
		return this.rqPattern;
	}

	public void setRqPattern(RqPattern rqPattern) {
		this.rqPattern = rqPattern;
	}

}