package com.infini.ccahe.dto;

import java.io.Serializable;

public class SessionCloseRQDto implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String binarySecurityToken;
	
	private String pseudoCityCode;
	
	private String swsUrl;
	
	private String swsMethodRequest;
	
	private String swsContentType;

	public String getBinarySecurityToken() {
		return binarySecurityToken;
	}

	public void setBinarySecurityToken(String binarySecurityToken) {
		this.binarySecurityToken = binarySecurityToken;
	}

	public String getPseudoCityCode() {
		return pseudoCityCode;
	}

	public void setPseudoCityCode(String pseudoCityCode) {
		this.pseudoCityCode = pseudoCityCode;
	}

	public String getSwsUrl() {
		return swsUrl;
	}

	public void setSwsUrl(String swsUrl) {
		this.swsUrl = swsUrl;
	}

	public String getSwsMethodRequest() {
		return swsMethodRequest;
	}

	public void setSwsMethodRequest(String swsMethodRequest) {
		this.swsMethodRequest = swsMethodRequest;
	}

	public String getSwsContentType() {
		return swsContentType;
	}

	public void setSwsContentType(String swsContentType) {
		this.swsContentType = swsContentType;
	}
	
}
