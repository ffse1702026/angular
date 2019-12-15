package com.infini.b2e.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="request_flight")
public class RequestFlight {
    @ManyToOne(fetch = FetchType.EAGER,cascade= CascadeType.MERGE)
    @JoinColumn(name="request_id",referencedColumnName="request_id", insertable=true, updatable=true)
    private RequestItem request_id;
    
    @Id
    private String segment_no;
    
    private String carrier;
    
    private String flight_number;
    
    private String departure_airport;
    
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date departure_date;
    
    private String departure_time;
    
    private String arrival_airport;
    
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date arrival_date;
    
    private String arrival_time;
    
    private int connection_indicator;
    
    private int prefer_flight;
    
    @CreationTimestamp
    private Date created_date;
    
    @UpdateTimestamp
    private Date last_updated_date;
    
    @Transient
    private String dateWeeksFrom;
    
    @Transient
    private String dateWeeksTo;

    public RequestFlight() {
        super();
    }

    /**
     * @return the request_id
     */
    public RequestItem getRequest_id() {
        return request_id;
    }

    /**
     * @param request_id the request_id to set
     */
    public void setRequest_id(RequestItem request_id) {
        this.request_id = request_id;
    }

    /**
     * @return the segment_no
     */
    public String getSegment_no() {
        return segment_no;
    }

    /**
     * @param segment_no the segment_no to set
     */
    public void setSegment_no(String segment_no) {
        this.segment_no = segment_no;
    }

    /**
     * @return the carrier
     */
    public String getCarrier() {
        return carrier;
    }

    /**
     * @param carrier the carrier to set
     */
    public void setCarrier(String carrier) {
        this.carrier = carrier;
    }

    /**
     * @return the flight_number
     */
    public String getFlight_number() {
        return flight_number;
    }

    /**
     * @param flight_number the flight_number to set
     */
    public void setFlight_number(String flight_number) {
        this.flight_number = flight_number;
    }

    /**
     * @return the departure_airport
     */
    public String getDeparture_airport() {
        return departure_airport;
    }

    /**
     * @param departure_airport the departure_airport to set
     */
    public void setDeparture_airport(String departure_airport) {
        this.departure_airport = departure_airport;
    }

    /**
     * @return the departure_date
     */
    public Date getDeparture_date() {
        return departure_date;
    }

    /**
     * @param departure_date the departure_date to set
     */
    public void setDeparture_date(Date departure_date) {
        this.departure_date = departure_date;
    }

    /**
     * @return the departure_time
     */
    public String getDeparture_time() {
        return departure_time;
    }

    /**
     * @param departure_time the departure_time to set
     */
    public void setDeparture_time(String departure_time) {
        this.departure_time = departure_time;
    }

    /**
     * @return the arrival_airport
     */
    public String getArrival_airport() {
        return arrival_airport;
    }

    /**
     * @param arrival_airport the arrival_airport to set
     */
    public void setArrival_airport(String arrival_airport) {
        this.arrival_airport = arrival_airport;
    }

    /**
     * @return the arrival_date
     */
    public Date getArrival_date() {
        return arrival_date;
    }

    /**
     * @param arrival_date the arrival_date to set
     */
    public void setArrival_date(Date arrival_date) {
        this.arrival_date = arrival_date;
    }

    /**
     * @return the arrival_time
     */
    public String getArrival_time() {
        return arrival_time;
    }

    /**
     * @param arrival_time the arrival_time to set
     */
    public void setArrival_time(String arrival_time) {
        this.arrival_time = arrival_time;
    }

    /**
     * @return the connection_indicator
     */
    public int getConnection_indicator() {
        return connection_indicator;
    }

    /**
     * @param connection_indicator the connection_indicator to set
     */
    public void setConnection_indicator(int connection_indicator) {
        this.connection_indicator = connection_indicator;
    }

    /**
     * @return the prefer_flight
     */
    public int getPrefer_flight() {
        return prefer_flight;
    }

    /**
     * @param prefer_flight the prefer_flight to set
     */
    public void setPrefer_flight(int prefer_flight) {
        this.prefer_flight = prefer_flight;
    }

    /**
     * @return the created_date
     */
    public Date getCreated_date() {
        return created_date;
    }

    /**
     * @param created_date the created_date to set
     */
    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    /**
     * @return the last_updated_date
     */
    public Date getLast_updated_date() {
        return last_updated_date;
    }

    /**
     * @param last_updated_date the last_updated_date to set
     */
    public void setLast_updated_date(Date last_updated_date) {
        this.last_updated_date = last_updated_date;
    }

    /**
     * @return the dateWeeksFrom
     */
    public String getDateWeeksFrom() {
        return dateWeeksFrom;
    }

    /**
     * @param dateWeeksFrom the dateWeeksFrom to set
     */
    public void setDateWeeksFrom(String dateWeeksFrom) {
        this.dateWeeksFrom = dateWeeksFrom;
    }

    /**
     * @return the dateWeeksTo
     */
    public String getDateWeeksTo() {
        return dateWeeksTo;
    }

    /**
     * @param dateWeeksTo the dateWeeksTo to set
     */
    public void setDateWeeksTo(String dateWeeksTo) {
        this.dateWeeksTo = dateWeeksTo;
    }

}
