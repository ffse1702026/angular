package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the rs_tax_component database table.
 * 
 */
@Entity
@Table(name="rs_tax_component")
@NamedQuery(name="RsTaxComponent.findAll", query="SELECT r FROM RsTaxComponent r")
public class RsTaxComponent implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private RsTaxComponentPK id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_time")
	private Date createdTime;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="last_updated_time")
	private Date lastUpdatedTime;

	public RsTaxComponent() {
	}

	public RsTaxComponentPK getId() {
		return this.id;
	}

	public void setId(RsTaxComponentPK id) {
		this.id = id;
	}

	public Date getCreatedTime() {
		return this.createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public Date getLastUpdatedTime() {
		return this.lastUpdatedTime;
	}

	public void setLastUpdatedTime(Date lastUpdatedTime) {
		this.lastUpdatedTime = lastUpdatedTime;
	}

}