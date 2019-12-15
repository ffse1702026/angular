package com.infini.ccahe.responsetask.model;

import java.io.Serializable;
import java.util.List;

public class FareComponent implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String ref;
	
	private List<Segment> segments;

	public String getRef() {
		return ref;
	}

	public void setRef(String ref) {
		this.ref = ref;
	}

	public List<Segment> getSegments() {
		return segments;
	}

	public void setSegments(List<Segment> segments) {
		this.segments = segments;
	}

}
