package com.d2e.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "check_status")
public class MessageStatus implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String id_group;
	@Id
	private String id_user;
	private String id_messgae_read;
	
	public String getId_group() {
		return id_group;
	}
	public void setId_group(String id_group) {
		this.id_group = id_group;
	}
	public String getId_user() {
		return id_user;
	}
	public void setId_user(String id_user) {
		this.id_user = id_user;
	}
	public String getId_messgae_read() {
		return id_messgae_read;
	}
	public void setId_messgae_read(String id_messgae_read) {
		this.id_messgae_read = id_messgae_read;
	}
	
}
