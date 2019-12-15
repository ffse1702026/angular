package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the mgmt_config database table.
 * 
 */
@Entity
@Table(name="mgmt_config")
@NamedQuery(name="MgmtConfig.findAll", query="SELECT m FROM MgmtConfig m")
public class MgmtConfig implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String username;

	private String password;

	@Column(name="pseudo_city_code")
	private String pseudoCityCode;

	@Column(name="sws_url")
	private String swsUrl;

	public MgmtConfig() {
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPseudoCityCode() {
		return this.pseudoCityCode;
	}

	public void setPseudoCityCode(String pseudoCityCode) {
		this.pseudoCityCode = pseudoCityCode;
	}

	public String getSwsUrl() {
		return this.swsUrl;
	}

	public void setSwsUrl(String swsUrl) {
		this.swsUrl = swsUrl;
	}

}