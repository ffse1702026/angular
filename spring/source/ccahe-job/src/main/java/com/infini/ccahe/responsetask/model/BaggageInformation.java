package com.infini.ccahe.responsetask.model;

import java.io.Serializable;
import java.util.List;

public class BaggageInformation implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String provisionType;
	
	private List<Segment> segments;

	public String getProvisionType() {
		return provisionType;
	}

	public void setProvisionType(String provisionType) {
		this.provisionType = provisionType;
	}

	public List<Segment> getSegments() {
		return segments;
	}

	public void setSegments(List<Segment> segments) {
		this.segments = segments;
	}
}
