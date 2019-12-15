package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the rs_segment database table.
 * 
 */
@Embeddable
public class RsSegmentPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="cache_id")
	private String cacheId;

	@Column(name="schedule_id")
	private short scheduleId;

	public RsSegmentPK() {
	}
	public String getCacheId() {
		return this.cacheId;
	}
	public void setCacheId(String cacheId) {
		this.cacheId = cacheId;
	}
	public short getScheduleId() {
		return this.scheduleId;
	}
	public void setScheduleId(short scheduleId) {
		this.scheduleId = scheduleId;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof RsSegmentPK)) {
			return false;
		}
		RsSegmentPK castOther = (RsSegmentPK)other;
		return 
			this.cacheId.equals(castOther.cacheId)
			&& (this.scheduleId == castOther.scheduleId);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.cacheId.hashCode();
		hash = hash * prime + ((int) this.scheduleId);
		
		return hash;
	}
}