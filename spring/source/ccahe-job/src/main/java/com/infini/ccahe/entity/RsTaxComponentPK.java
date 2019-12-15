package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the rs_tax_component database table.
 * 
 */
@Embeddable
public class RsTaxComponentPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="cache_id")
	private String cacheId;

	@Column(name="itinerary_id")
	private short itineraryId;

	@Column(name="passenger_type")
	private String passengerType;

	@Column(name="tax_id")
	private short taxId;

	public RsTaxComponentPK() {
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
	public short getTaxId() {
		return this.taxId;
	}
	public void setTaxId(short taxId) {
		this.taxId = taxId;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof RsTaxComponentPK)) {
			return false;
		}
		RsTaxComponentPK castOther = (RsTaxComponentPK)other;
		return 
			this.cacheId.equals(castOther.cacheId)
			&& (this.itineraryId == castOther.itineraryId)
			&& this.passengerType.equals(castOther.passengerType)
			&& (this.taxId == castOther.taxId);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.cacheId.hashCode();
		hash = hash * prime + ((int) this.itineraryId);
		hash = hash * prime + this.passengerType.hashCode();
		hash = hash * prime + ((int) this.taxId);
		
		return hash;
	}
}