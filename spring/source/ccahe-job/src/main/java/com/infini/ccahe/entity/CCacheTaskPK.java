package com.infini.ccahe.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class CCacheTaskPK implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Column(name = "pattern_id")
	private String patternId;
	
	@Column(name = "outbound_date_type")
	private String outboundDateType;
	
	@Column(name = "outbound_time_position")
	private String outboundTimePosition;
	
	@Column(name = "inbound_time_position")
	private String inboundTimePosition;

	@Column(name = "stay_day")
	private short stayDay;

	@Column(name = "cabin")
	private String cabin;

	public String getPatternId() {
		return patternId;
	}

	public void setPatternId(String patternId) {
		this.patternId = patternId;
	}

	public String getOutboundTimePosition() {
		return outboundTimePosition;
	}

	public void setOutboundTimePosition(String outboundTimePosition) {
		this.outboundTimePosition = outboundTimePosition;
	}

	public String getInboundTimePosition() {
		return inboundTimePosition;
	}

	public void setInboundTimePosition(String inboundTimePosition) {
		this.inboundTimePosition = inboundTimePosition;
	}

	public short getStayDay() {
		return stayDay;
	}

	public void setStayDay(short stayDay) {
		this.stayDay = stayDay;
	}

	public String getCabin() {
		return cabin;
	}

	public void setCabin(String cabin) {
		this.cabin = cabin;
	}

	public String getOutboundDateType() {
		return outboundDateType;
	}

	public void setOutboundDateType(String outboundDateType) {
		this.outboundDateType = outboundDateType;
	}
}
