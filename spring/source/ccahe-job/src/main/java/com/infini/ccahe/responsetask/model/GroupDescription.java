package com.infini.ccahe.responsetask.model;

import java.io.Serializable;
import java.util.List;

public class GroupDescription implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private List<LegDescription> legDescriptions;

	public List<LegDescription> getLegDescriptions() {
		return legDescriptions;
	}

	public void setLegDescriptions(List<LegDescription> legDescriptions) {
		this.legDescriptions = legDescriptions;
	}
}
