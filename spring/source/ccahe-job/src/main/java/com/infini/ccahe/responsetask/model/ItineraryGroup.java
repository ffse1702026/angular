package com.infini.ccahe.responsetask.model;

import java.io.Serializable;
import java.util.List;

public class ItineraryGroup implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private List<GroupDescription> groupDescriptions;
	
	private List<Itinerary> itineraries;

	public List<GroupDescription> getGroupDescriptions() {
		return groupDescriptions;
	}

	public void setGroupDescriptions(List<GroupDescription> groupDescriptions) {
		this.groupDescriptions = groupDescriptions;
	}

	public List<Itinerary> getItineraries() {
		return itineraries;
	}

	public void setItineraries(List<Itinerary> itineraries) {
		this.itineraries = itineraries;
	}
}
