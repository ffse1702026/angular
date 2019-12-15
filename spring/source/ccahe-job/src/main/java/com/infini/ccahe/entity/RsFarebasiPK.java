package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the rs_farebasis database table.
 * 
 */
@Embeddable
public class RsFarebasiPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="cache_id")
	private String cacheId;

	@Column(name="itinerary_id")
	private short itineraryId;

	@Column(name="passenger_type")
	private String passengerType;

	@Column(name="segment_no")
	private short segmentNo;

	public RsFarebasiPK() {
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
	public short getSegmentNo() {
		return this.segmentNo;
	}
	public void setSegmentNo(short segmentNo) {
		this.segmentNo = segmentNo;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof RsFarebasiPK)) {
			return false;
		}
		RsFarebasiPK castOther = (RsFarebasiPK)other;
		return 
			this.cacheId.equals(castOther.cacheId)
			&& (this.itineraryId == castOther.itineraryId)
			&& this.passengerType.equals(castOther.passengerType)
			&& (this.segmentNo == castOther.segmentNo);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.cacheId.hashCode();
		hash = hash * prime + ((int) this.itineraryId);
		hash = hash * prime + this.passengerType.hashCode();
		hash = hash * prime + ((int) this.segmentNo);
		
		return hash;
	}
}