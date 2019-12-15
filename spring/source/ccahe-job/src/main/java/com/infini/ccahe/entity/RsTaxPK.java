package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the rs_tax database table.
 * 
 */
@Embeddable
public class RsTaxPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="cache_id")
	private String cacheId;

	@Column(name="tax_id")
	private short taxId;

	private String code;

	public RsTaxPK() {
	}
	public String getCacheId() {
		return this.cacheId;
	}
	public void setCacheId(String cacheId) {
		this.cacheId = cacheId;
	}
	public short getTaxId() {
		return this.taxId;
	}
	public void setTaxId(short taxId) {
		this.taxId = taxId;
	}
	public String getCode() {
		return this.code;
	}
	public void setCode(String code) {
		this.code = code;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof RsTaxPK)) {
			return false;
		}
		RsTaxPK castOther = (RsTaxPK)other;
		return 
			this.cacheId.equals(castOther.cacheId)
			&& (this.taxId == castOther.taxId)
			&& this.code.equals(castOther.code);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.cacheId.hashCode();
		hash = hash * prime + ((int) this.taxId);
		hash = hash * prime + this.code.hashCode();
		
		return hash;
	}
}