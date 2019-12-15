package com.infini.ccahe.responsetask.model;

import java.io.Serializable;
import java.util.List;

public class GroupedItineraryResponse implements Serializable {
	private static final long serialVersionUID = 1L;

	private List<ScheduleDesc> scheduleDescs;

	private List<TaxDesc> taxDescs;

	private List<FareComponentDesc> fareComponentDescs;

	private List<LegDesc> legDescs;

	private List<ItineraryGroup> itineraryGroups;

	public List<LegDesc> getLegDescs() {
		return legDescs;
	}

	public void setLegDescs(List<LegDesc> legDescs) {
		this.legDescs = legDescs;
	}

	public List<ItineraryGroup> getItineraryGroups() {
		return itineraryGroups;
	}

	public void setItineraryGroups(List<ItineraryGroup> itineraryGroups) {
		this.itineraryGroups = itineraryGroups;
	}

	public List<ScheduleDesc> getScheduleDescs() {
		return scheduleDescs;
	}

	public void setScheduleDescs(List<ScheduleDesc> scheduleDescs) {
		this.scheduleDescs = scheduleDescs;
	}

	public List<TaxDesc> getTaxDescs() {
		return taxDescs;
	}

	public void setTaxDescs(List<TaxDesc> taxDescs) {
		this.taxDescs = taxDescs;
	}

	public List<FareComponentDesc> getFareComponentDescs() {
		return fareComponentDescs;
	}

	public void setFareComponentDescs(List<FareComponentDesc> fareComponentDescs) {
		this.fareComponentDescs = fareComponentDescs;
	}
}
