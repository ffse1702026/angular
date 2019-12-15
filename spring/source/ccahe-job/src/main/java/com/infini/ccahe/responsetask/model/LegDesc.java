package com.infini.ccahe.responsetask.model;

import java.io.Serializable;
import java.util.List;

public class LegDesc implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String id;
	
	private List<Schedule> schedules;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<Schedule> getSchedules() {
		return schedules;
	}

	public void setSchedules(List<Schedule> schedules) {
		this.schedules = schedules;
	}
}
