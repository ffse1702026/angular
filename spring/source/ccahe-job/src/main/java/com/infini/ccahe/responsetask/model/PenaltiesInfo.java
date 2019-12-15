package com.infini.ccahe.responsetask.model;

import java.io.Serializable;
import java.util.List;

public class PenaltiesInfo implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private List<Penalty> penalties;

	public List<Penalty> getPenalties() {
		return penalties;
	}

	public void setPenalties(List<Penalty> penalties) {
		this.penalties = penalties;
	}
}
