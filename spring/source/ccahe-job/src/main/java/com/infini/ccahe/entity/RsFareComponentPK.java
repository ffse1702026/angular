package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the rs_fare_component database table.
 * 
 */
@Embeddable
public class RsFareComponentPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="cache_id")
	private String cacheId;

	@Column(name="itinerary_id")
	private short itineraryId;

	@Column(name="passenger_type")
	private String passengerType;

	public RsFareComponentPK() {
	}
	public String getCacheId() {
		return this.cacheId;
	}
	public void setCacheId(String cacheId) {
		this.cacheId = cacheId;
	}
	public short getItineraryId() {
		return this.itineraryId;
	}
	public void setItineraryId(short itineraryId) {
		this.itineraryId = itineraryId;
	}
	public String getPassengerType() {
		return this.passengerType;
	}
	public void setPassengerType(String passengerType) {
		this.passengerType = passengerType;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof RsFareComponentPK)) {
			return false;
		}
		RsFareComponentPK castOther = (RsFareComponentPK)other;
		return 
			this.cacheId.equals(castOther.cacheId)
			&& (this.itineraryId == castOther.itineraryId)
			&& this.passengerType.equals(castOther.passengerType);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.cacheId.hashCode();
		hash = hash * prime + ((int) this.itineraryId);
		hash = hash * prime + this.passengerType.hashCode();
		
		return hash;
	}
}