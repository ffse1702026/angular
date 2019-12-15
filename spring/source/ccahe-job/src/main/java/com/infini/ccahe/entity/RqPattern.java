package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the rq_pattern database table.
 * 
 */
@Entity
@Table(name="rq_pattern")
@NamedQuery(name="RqPattern.findAll", query="SELECT r FROM RqPattern r")
public class RqPattern implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="pattern_id")
	private String patternId;

	@Column(name="arrival_airport")
	private String arrivalAirport;

	private String carrier;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_time")
	private Date createdTime;

	@Column(name="departure_airport")
	private String departureAirport;

	@Column(name="direct_flight_only")
	private byte directFlightOnly;

	@Column(name="exclude_codeshare")
	private short excludeCodeshare;

	@Column(name="free_piece")
	private short freePiece;

	@Column(name="include_transfer")
	private byte includeTransfer;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="last_updated_time")
	private Date lastUpdatedTime;

	@Column(name="num_of_adt")
	private short numOfAdt;

	@Column(name="num_of_cnn")
	private short numOfCnn;

	@Column(name="num_of_inf")
	private short numOfInf;

	@Column(name="num_of_ins")
	private short numOfIns;

	@Column(name="outbound_date_from")
	private short outboundDateFrom;

	@Column(name="outbound_date_to")
	private short outboundDateTo;

	private String rbd;

	private short stops;

	//bi-directional many-to-one association to RqPatternCabin
	@OneToMany(mappedBy="rqPattern")
	private List<RqPatternCabin> rqPatternCabins;

	//bi-directional many-to-one association to RqPatternInboundtime
	@OneToMany(mappedBy="rqPattern")
	private List<RqPatternInboundtime> rqPatternInboundtimes;

	//bi-directional many-to-one association to RqPatternOutboundtime
	@OneToMany(mappedBy="rqPattern")
	private List<RqPatternOutboundtime> rqPatternOutboundtimes;

	//bi-directional many-to-one association to RqPatternStayday
	@OneToMany(mappedBy="rqPattern")
	private List<RqPatternStayday> rqPatternStaydays;

	public RqPattern() {
	}

	public String getPatternId() {
		return this.patternId;
	}

	public void setPatternId(String patternId) {
		this.patternId = patternId;
	}

	public String getArrivalAirport() {
		return this.arrivalAirport;
	}

	public void setArrivalAirport(String arrivalAirport) {
		this.arrivalAirport = arrivalAirport;
	}

	public String getCarrier() {
		return this.carrier;
	}

	public void setCarrier(String carrier) {
		this.carrier = carrier;
	}

	public Date getCreatedTime() {
		return this.createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getDepartureAirport() {
		return this.departureAirport;
	}

	public void setDepartureAirport(String departureAirport) {
		this.departureAirport = departureAirport;
	}

	public byte getDirectFlightOnly() {
		return this.directFlightOnly;
	}

	public void setDirectFlightOnly(byte directFlightOnly) {
		this.directFlightOnly = directFlightOnly;
	}

	public short getExcludeCodeshare() {
		return this.excludeCodeshare;
	}

	public void setExcludeCodeshare(short excludeCodeshare) {
		this.excludeCodeshare = excludeCodeshare;
	}

	public short getFreePiece() {
		return this.freePiece;
	}

	public void setFreePiece(short freePiece) {
		this.freePiece = freePiece;
	}

	public byte getIncludeTransfer() {
		return this.includeTransfer;
	}

	public void setIncludeTransfer(byte includeTransfer) {
		this.includeTransfer = includeTransfer;
	}

	public Date getLastUpdatedTime() {
		return this.lastUpdatedTime;
	}

	public void setLastUpdatedTime(Date lastUpdatedTime) {
		this.lastUpdatedTime = lastUpdatedTime;
	}

	public short getNumOfAdt() {
		return this.numOfAdt;
	}

	public void setNumOfAdt(short numOfAdt) {
		this.numOfAdt = numOfAdt;
	}

	public short getNumOfCnn() {
		return this.numOfCnn;
	}

	public void setNumOfCnn(short numOfCnn) {
		this.numOfCnn = numOfCnn;
	}

	public short getNumOfInf() {
		return this.numOfInf;
	}

	public void setNumOfInf(short numOfInf) {
		this.numOfInf = numOfInf;
	}

	public short getNumOfIns() {
		return this.numOfIns;
	}

	public void setNumOfIns(short numOfIns) {
		this.numOfIns = numOfIns;
	}

	public short getOutboundDateFrom() {
		return this.outboundDateFrom;
	}

	public void setOutboundDateFrom(short outboundDateFrom) {
		this.outboundDateFrom = outboundDateFrom;
	}

	public short getOutboundDateTo() {
		return this.outboundDateTo;
	}

	public void setOutboundDateTo(short outboundDateTo) {
		this.outboundDateTo = outboundDateTo;
	}

	public String getRbd() {
		return this.rbd;
	}

	public void setRbd(String rbd) {
		this.rbd = rbd;
	}

	public short getStops() {
		return this.stops;
	}

	public void setStops(short stops) {
		this.stops = stops;
	}

	public List<RqPatternCabin> getRqPatternCabins() {
		return this.rqPatternCabins;
	}

	public void setRqPatternCabins(List<RqPatternCabin> rqPatternCabins) {
		this.rqPatternCabins = rqPatternCabins;
	}

	public RqPatternCabin addRqPatternCabin(RqPatternCabin rqPatternCabin) {
		getRqPatternCabins().add(rqPatternCabin);
		rqPatternCabin.setRqPattern(this);

		return rqPatternCabin;
	}

	public RqPatternCabin removeRqPatternCabin(RqPatternCabin rqPatternCabin) {
		getRqPatternCabins().remove(rqPatternCabin);
		rqPatternCabin.setRqPattern(null);

		return rqPatternCabin;
	}

	public List<RqPatternInboundtime> getRqPatternInboundtimes() {
		return this.rqPatternInboundtimes;
	}

	public void setRqPatternInboundtimes(List<RqPatternInboundtime> rqPatternInboundtimes) {
		this.rqPatternInboundtimes = rqPatternInboundtimes;
	}

	public RqPatternInboundtime addRqPatternInboundtime(RqPatternInboundtime rqPatternInboundtime) {
		getRqPatternInboundtimes().add(rqPatternInboundtime);
		rqPatternInboundtime.setRqPattern(this);

		return rqPatternInboundtime;
	}

	public RqPatternInboundtime removeRqPatternInboundtime(RqPatternInboundtime rqPatternInboundtime) {
		getRqPatternInboundtimes().remove(rqPatternInboundtime);
		rqPatternInboundtime.setRqPattern(null);

		return rqPatternInboundtime;
	}

	public List<RqPatternOutboundtime> getRqPatternOutboundtimes() {
		return this.rqPatternOutboundtimes;
	}

	public void setRqPatternOutboundtimes(List<RqPatternOutboundtime> rqPatternOutboundtimes) {
		this.rqPatternOutboundtimes = rqPatternOutboundtimes;
	}

	public RqPatternOutboundtime addRqPatternOutboundtime(RqPatternOutboundtime rqPatternOutboundtime) {
		getRqPatternOutboundtimes().add(rqPatternOutboundtime);
		rqPatternOutboundtime.setRqPattern(this);

		return rqPatternOutboundtime;
	}

	public RqPatternOutboundtime removeRqPatternOutboundtime(RqPatternOutboundtime rqPatternOutboundtime) {
		getRqPatternOutboundtimes().remove(rqPatternOutboundtime);
		rqPatternOutboundtime.setRqPattern(null);

		return rqPatternOutboundtime;
	}

	public List<RqPatternStayday> getRqPatternStaydays() {
		return this.rqPatternStaydays;
	}

	public void setRqPatternStaydays(List<RqPatternStayday> rqPatternStaydays) {
		this.rqPatternStaydays = rqPatternStaydays;
	}

	public RqPatternStayday addRqPatternStayday(RqPatternStayday rqPatternStayday) {
		getRqPatternStaydays().add(rqPatternStayday);
		rqPatternStayday.setRqPattern(this);

		return rqPatternStayday;
	}

	public RqPatternStayday removeRqPatternStayday(RqPatternStayday rqPatternStayday) {
		getRqPatternStaydays().remove(rqPatternStayday);
		rqPatternStayday.setRqPattern(null);

		return rqPatternStayday;
	}

}