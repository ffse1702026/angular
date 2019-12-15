package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the log_access database table.
 * 
 */
@Entity
@Table(name="log_access")
@NamedQuery(name="LogAccess.findAll", query="SELECT l FROM LogAccess l")
public class LogAccess implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	@Column(name="access_result")
	private String accessResult;

	@Column(name="access_time")
	private String accessTime;

	private String ip;

	private String pcc;

	private String user;

	public LogAccess() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccessResult() {
		return this.accessResult;
	}

	public void setAccessResult(String accessResult) {
		this.accessResult = accessResult;
	}

	public String getAccessTime() {
		return this.accessTime;
	}

	public void setAccessTime(String accessTime) {
		this.accessTime = accessTime;
	}

	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getPcc() {
		return this.pcc;
	}

	public void setPcc(String pcc) {
		this.pcc = pcc;
	}

	public String getUser() {
		return this.user;
	}

	public void setUser(String user) {
		this.user = user;
	}

}