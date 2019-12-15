package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the mgmt_user database table.
 * 
 */
@Entity
@Table(name="mgmt_user")
@NamedQuery(name="MgmtUser.findAll", query="SELECT m FROM MgmtUser m")
public class MgmtUser implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	@Lob
	@Column(name="agent_name")
	private String agentName;

	@Lob
	@Column(name="company_name")
	private String companyName;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_time")
	private Date createdTime;

	@Column(name="enable_password")
	private byte enablePassword;

	@Lob
	private String ip;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="last_updated_time")
	private Date lastUpdatedTime;

	private String password;

	private String pcc;

	public MgmtUser() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAgentName() {
		return this.agentName;
	}

	public void setAgentName(String agentName) {
		this.agentName = agentName;
	}

	public String getCompanyName() {
		return this.companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Date getCreatedTime() {
		return this.createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public byte getEnablePassword() {
		return this.enablePassword;
	}

	public void setEnablePassword(byte enablePassword) {
		this.enablePassword = enablePassword;
	}

	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Date getLastUpdatedTime() {
		return this.lastUpdatedTime;
	}

	public void setLastUpdatedTime(Date lastUpdatedTime) {
		this.lastUpdatedTime = lastUpdatedTime;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPcc() {
		return this.pcc;
	}

	public void setPcc(String pcc) {
		this.pcc = pcc;
	}

}