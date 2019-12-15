package com.infini.ccahe.responsetask.model;

import java.io.Serializable;

public class FareMessage implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String info;

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
}
