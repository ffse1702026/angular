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

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="request_passenger")
public class RequestPassenger {
    @ManyToOne(fetch = FetchType.EAGER,cascade= CascadeType.MERGE)
    @JoinColumn(name="request_id",referencedColumnName="request_id", insertable=true, updatable=true)
    private RequestItem request_id;
    
    @Id
    private int passenger_no;
    
    private String full_name_kanji;
    
    private String full_name_romaji;
    
    private String gender;
    
    private int mileage_number;
    
    private int passenger_type;
    
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
    
    private Date created_date;
    
    private Date last_updated_date;
    
    public RequestPassenger() {

    }

    /**
     * @return the passenger_type
     */
    public int getPassenger_type() {
        return passenger_type;
    }


    /**
     * @param passenger_type the passenger_type to set
     */
    public void setPassenger_type(int passenger_type) {
        this.passenger_type = passenger_type;
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
     * @return the passenger_no
     */
    public int getPassenger_no() {
        return passenger_no;
    }

    /**
     * @param passenger_no
     *            the passenger_no to set
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
     * @param full_name_kanji
     *            the full_name_kanji to set
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
     * @param full_name_romaji
     *            the full_name_romaji to set
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
     * @param gender
     *            the gender to set
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
     * @param mileage_number
     *            the mileage_number to set
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
     * @param date_of_birth
     *            the date_of_birth to set
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
     * @param seat_request
     *            the seat_request to set
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
     * @param meal_reaquest
     *            the meal_reaquest to set
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
     * @param passport_number
     *            the passport_number to set
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
     * @param passport_valid_date
     *            the passport_valid_date to set
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
     * @param nationality
     *            the nationality to set
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
     * @param issued_country
     *            the issued_country to set
     */
    public void setIssued_country(String issued_country) {
        this.issued_country = issued_country;
    }

    /**
     * @return the created_date
     */
    public Date getCreated_date() {
        return created_date;
    }

    /**
     * @param created_date
     *            the created_date to set
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
     * @param last_updated_date
     *            the last_updated_date to set
     */
    public void setLast_updated_date(Date last_updated_date) {
        this.last_updated_date = last_updated_date;
    }

}
