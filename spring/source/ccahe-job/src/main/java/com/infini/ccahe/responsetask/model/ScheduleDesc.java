package com.infini.ccahe.responsetask.model;

import java.io.Serializable;
import java.util.List;

public class ScheduleDesc implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String id;
	
	private String stops;
	
	private List<Departure> departures;
	
	private List<Arrival> arrivals;
	
	private List<Carrier> carriers;
	
	private List<HiddenStop> hiddenStops;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStops() {
		return stops;
	}

	public void setStops(String stops) {
		this.stops = stops;
	}

	public List<Departure> getDepartures() {
		return departures;
	}

	public void setDepartures(List<Departure> departures) {
		this.departures = departures;
	}

	public List<Arrival> getArrivals() {
		return arrivals;
	}

	public void setArrivals(List<Arrival> arrivals) {
		this.arrivals = arrivals;
	}

	public List<Carrier> getCarriers() {
		return carriers;
	}

	public void setCarriers(List<Carrier> carriers) {
		this.carriers = carriers;
	}

	public List<HiddenStop> getHiddenStops() {
		return hiddenStops;
	}

	public void setHiddenStops(List<HiddenStop> hiddenStops) {
		this.hiddenStops = hiddenStops;
	}
}
