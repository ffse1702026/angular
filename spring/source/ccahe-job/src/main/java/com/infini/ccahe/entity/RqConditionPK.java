package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the rq_condition database table.
 * 
 */
@Embeddable
public class RqConditionPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="cache_id")
	private String cacheId;

	@Column(name="request_id")
	private String requestId;

	public RqConditionPK() {
	}
	public String getCacheId() {
		return this.cacheId;
	}
	public void setCacheId(String cacheId) {
		this.cacheId = cacheId;
	}
	public String getRequestId() {
		return this.requestId;
	}
	public void setRequestId(String requestId) {
		this.requestId = requestId;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof RqConditionPK)) {
			return false;
		}
		RqConditionPK castOther = (RqConditionPK)other;
		return 
			this.cacheId.equals(castOther.cacheId)
			&& this.requestId.equals(castOther.requestId);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.cacheId.hashCode();
		hash = hash * prime + this.requestId.hashCode();
		
		return hash;
	}
}