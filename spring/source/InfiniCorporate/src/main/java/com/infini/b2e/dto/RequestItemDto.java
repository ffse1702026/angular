package com.infini.b2e.dto;

import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

public class RequestItemDto {
    private String requestor_name;
    private String requestor_phone;
    private String to;
    private String cc;
    private int num_of_adt;
    private int num_of_cnn;
    private int num_of_ins;
    private int num_of_inf;
    private int request_type;
    private int prefer_condition;
    private int prefer_class;
    private int prefer_fare;
    private int changeable;
    private int refundable;
    private String other_request;
    private String free_text;
    private String agent_id;
    private String agent_name;
    private String corporate_id;
    private String corporate_name;
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
    private int passenger_no;
    private String full_name_kanji;
    private String full_name_romaji;
    private String gender;
    private int mileage_number;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date date_of_birth;
    private String seat_request;
    private String meal_reaquest;
    private String passport_number;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date passport_valid_date;
    private String nationality;
    private String issued_country;
    private String airport_name_jp;
    private String carrier_name_jp;

    public RequestItemDto() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @return the requestor_name
     */
    public String getRequestor_name() {
        return requestor_name;
    }

    /**
     * @param requestor_name the requestor_name to set
     */
    public void setRequestor_name(String requestor_name) {
        this.requestor_name = requestor_name;
    }

    /**
     * @return the requestor_phone
     */
    public String getRequestor_phone() {
        return requestor_phone;
    }

    /**
     * @param requestor_phone the requestor_phone to set
     */
    public void setRequestor_phone(String requestor_phone) {
        this.requestor_phone = requestor_phone;
    }

    /**
     * @return the to
     */
    public String getTo() {
        return to;
    }

    /**
     * @param to the to to set
     */
    public void setTo(String to) {
        this.to = to;
    }

    /**
     * @return the cc
     */
    public String getCc() {
        return cc;
    }

    /**
     * @param cc the cc to set
     */
    public void setCc(String cc) {
        this.cc = cc;
    }

    /**
     * @return the num_of_adt
     */
    public int getNum_of_adt() {
        return num_of_adt;
    }

    /**
     * @param num_of_adt the num_of_adt to set
     */
    public void setNum_of_adt(int num_of_adt) {
        this.num_of_adt = num_of_adt;
    }

    /**
     * @return the num_of_cnn
     */
    public int getNum_of_cnn() {
        return num_of_cnn;
    }

    /**
     * @param num_of_cnn the num_of_cnn to set
     */
    public void setNum_of_cnn(int num_of_cnn) {
        this.num_of_cnn = num_of_cnn;
    }

    /**
     * @return the num_of_ins
     */
    public int getNum_of_ins() {
        return num_of_ins;
    }

    /**
     * @param num_of_ins the num_of_ins to set
     */
    public void setNum_of_ins(int num_of_ins) {
        this.num_of_ins = num_of_ins;
    }

    /**
     * @return the num_of_inf
     */
    public int getNum_of_inf() {
        return num_of_inf;
    }

    /**
     * @param num_of_inf the num_of_inf to set
     */
    public void setNum_of_inf(int num_of_inf) {
        this.num_of_inf = num_of_inf;
    }

    /**
     * @return the request_type
     */
    public int getRequest_type() {
        return request_type;
    }

    /**
     * @param request_type the request_type to set
     */
    public void setRequest_type(int request_type) {
        this.request_type = request_type;
    }

    /**
     * @return the prefer_condition
     */
    public int getPrefer_condition() {
        return prefer_condition;
    }

    /**
     * @param prefer_condition the prefer_condition to set
     */
    public void setPrefer_condition(int prefer_condition) {
        this.prefer_condition = prefer_condition;
    }

    /**
     * @return the prefer_class
     */
    public int getPrefer_class() {
        return prefer_class;
    }

    /**
     * @param prefer_class the prefer_class to set
     */
    public void setPrefer_class(int prefer_class) {
        this.prefer_class = prefer_class;
    }

    /**
     * @return the prefer_fare
     */
    public int getPrefer_fare() {
        return prefer_fare;
    }

    /**
     * @param prefer_fare the prefer_fare to set
     */
    public void setPrefer_fare(int prefer_fare) {
        this.prefer_fare = prefer_fare;
    }

    /**
     * @return the changeable
     */
    public int getChangeable() {
        return changeable;
    }

    /**
     * @param changeable the changeable to set
     */
    public void setChangeable(int changeable) {
        this.changeable = changeable;
    }

    /**
     * @return the refundable
     */
    public int getRefundable() {
        return refundable;
    }

    /**
     * @param refundable the refundable to set
     */
    public void setRefundable(int refundable) {
        this.refundable = refundable;
    }

    /**
     * @return the other_request
     */
    public String getOther_request() {
        return other_request;
    }

    /**
     * @param other_request the other_request to set
     */
    public void setOther_request(String other_request) {
        this.other_request = other_request;
    }

    /**
     * @return the free_text
     */
    public String getFree_text() {
        return free_text;
    }

    /**
     * @param free_text the free_text to set
     */
    public void setFree_text(String free_text) {
        this.free_text = free_text;
    }

    /**
     * @return the agent_id
     */
    public String getAgent_id() {
        return agent_id;
    }

    /**
     * @param agent_id the agent_id to set
     */
    public void setAgent_id(String agent_id) {
        this.agent_id = agent_id;
    }

    /**
     * @return the agent_name
     */
    public String getAgent_name() {
        return agent_name;
    }

    /**
     * @param agent_name the agent_name to set
     */
    public void setAgent_name(String agent_name) {
        this.agent_name = agent_name;
    }

    /**
     * @return the corporate_id
     */
    public String getCorporate_id() {
        return corporate_id;
    }

    /**
     * @param corporate_id the corporate_id to set
     */
    public void setCorporate_id(String corporate_id) {
        this.corporate_id = corporate_id;
    }

    /**
     * @return the corporate_name
     */
    public String getCorporate_name() {
        return corporate_name;
    }

    /**
     * @param corporate_name the corporate_name to set
     */
    public void setCorporate_name(String corporate_name) {
        this.corporate_name = corporate_name;
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
     * @return the passenger_no
     */
    public int getPassenger_no() {
        return passenger_no;
    }

    /**
     * @param passenger_no the passenger_no to set
     */
    public void setPassenger_no(int passenger_no) {
        this.passenger_no = passenger_no;
    }

    /**
     * @return the full_name_kanji
     */
    public String getFull_name_kanji() {
        return full_name_kanji;
    }

    /**
     * @param full_name_kanji the full_name_kanji to set
     */
    public void setFull_name_kanji(String full_name_kanji) {
        this.full_name_kanji = full_name_kanji;
    }

    /**
     * @return the full_name_romaji
     */
    public String getFull_name_romaji() {
        return full_name_romaji;
    }

    /**
     * @param full_name_romaji the full_name_romaji to set
     */
    public void setFull_name_romaji(String full_name_romaji) {
        this.full_name_romaji = full_name_romaji;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the mileage_number
     */
    public int getMileage_number() {
        return mileage_number;
    }

    /**
     * @param mileage_number the mileage_number to set
     */
    public void setMileage_number(int mileage_number) {
        this.mileage_number = mileage_number;
    }

    /**
     * @return the date_of_birth
     */
    public Date getDate_of_birth() {
        return date_of_birth;
    }

    /**
     * @param date_of_birth the date_of_birth to set
     */
    public void setDate_of_birth(Date date_of_birth) {
        this.date_of_birth = date_of_birth;
    }

    /**
     * @return the seat_request
     */
    public String getSeat_request() {
        return seat_request;
    }

    /**
     * @param seat_request the seat_request to set
     */
    public void setSeat_request(String seat_request) {
        this.seat_request = seat_request;
    }

    /**
     * @return the meal_reaquest
     */
    public String getMeal_reaquest() {
        return meal_reaquest;
    }

    /**
     * @param meal_reaquest the meal_reaquest to set
     */
    public void setMeal_reaquest(String meal_reaquest) {
        this.meal_reaquest = meal_reaquest;
    }

    /**
     * @return the passport_number
     */
    public String getPassport_number() {
        return passport_number;
    }

    /**
     * @param passport_number the passport_number to set
     */
    public void setPassport_number(String passport_number) {
        this.passport_number = passport_number;
    }

    /**
     * @return the passport_valid_date
     */
    public Date getPassport_valid_date() {
        return passport_valid_date;
    }

    /**
     * @param passport_valid_date the passport_valid_date to set
     */
    public void setPassport_valid_date(Date passport_valid_date) {
        this.passport_valid_date = passport_valid_date;
    }

    /**
     * @return the nationality
     */
    public String getNationality() {
        return nationality;
    }

    /**
     * @param nationality the nationality to set
     */
    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    /**
     * @return the issued_country
     */
    public String getIssued_country() {
        return issued_country;
    }

    /**
     * @param issued_country the issued_country to set
     */
    public void setIssued_country(String issued_country) {
        this.issued_country = issued_country;
    }

    /**
     * @return the airport_name_jp
     */
    public String getAirport_name_jp() {
        return airport_name_jp;
    }

    /**
     * @param airport_name_jp the airport_name_jp to set
     */
    public void setAirport_name_jp(String airport_name_jp) {
        this.airport_name_jp = airport_name_jp;
    }

    /**
     * @return the carrier_name_jp
     */
    public String getCarrier_name_jp() {
        return carrier_name_jp;
    }

    /**
     * @param carrier_name_jp the carrier_name_jp to set
     */
    public void setCarrier_name_jp(String carrier_name_jp) {
        this.carrier_name_jp = carrier_name_jp;
    }
    
}
