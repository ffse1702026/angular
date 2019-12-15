package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the rs_hidden_stop database table.
 * 
 */
@Embeddable
public class RsHiddenStopPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="cache_id")
	private String cacheId;

	@Column(name="schedule_id")
	private short scheduleId;

	@Column(name="hidden_stop_id")
	private short hiddenStopId;

	public RsHiddenStopPK() {
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
	public short getHiddenStopId() {
		return this.hiddenStopId;
	}
	public void setHiddenStopId(short hiddenStopId) {
		this.hiddenStopId = hiddenStopId;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof RsHiddenStopPK)) {
			return false;
		}
		RsHiddenStopPK castOther = (RsHiddenStopPK)other;
		return 
			this.cacheId.equals(castOther.cacheId)
			&& (this.scheduleId == castOther.scheduleId)
			&& (this.hiddenStopId == castOther.hiddenStopId);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.cacheId.hashCode();
		hash = hash * prime + ((int) this.scheduleId);
		hash = hash * prime + ((int) this.hiddenStopId);
		
		return hash;
	}
}