package com.infini.b2e.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user_corporate")
public class UserCorporate {
    @ManyToOne(fetch = FetchType.EAGER,cascade= CascadeType.MERGE)
    @JoinColumn(name="agent_id",referencedColumnName="agent_id", insertable=true, updatable=true)
    private UserAgent agent_id;
    @Id
    private String corporate_id;
    private String corporate_name;
    private String agent_name;
    private String password;
    private String mail_address;
    private String referrer_url;
    private String logo_path;
    private String background_path;
    private int search_valid_date;
    private String lcc_airline_list;
    private int display_hotel;
    private int display_rental_car;
    private int display_local_transportation;
    private int display_visa_service;
    private int display_wifi;
    private int display_insurance;
    private String display_other1;
    private String display_other2;
    private String footer_html;
    private String norification_html;
    private String to;
    private String bcc;
    private String signature;
    private int delete_flg;
    private Date created_date;
    private Date last_updated_date;

    public UserCorporate() {
        super();
    }
    
    /**
     * @return the agent_id
     */
    public UserAgent getAgent_id() {
        return agent_id;
    }

    /**
     * @param agent_id the agent_id to set
     */
    public void setAgent_id(UserAgent agent_id) {
        this.agent_id = agent_id;
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
     * @return the agent_name
     */
    public String getAgent_name() {
        return agent_name;
    }

    /**
     * @param agent_name
     *            the agent_name to set
     */
    public void setAgent_name(String agent_name) {
        this.agent_name = agent_name;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password
     *            the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the mail_address
     */
    public String getMail_address() {
        return mail_address;
    }

    /**
     * @param mail_address
     *            the mail_address to set
     */
    public void setMail_address(String mail_address) {
        this.mail_address = mail_address;
    }

    /**
     * @return the referrer_url
     */
    public String getReferrer_url() {
        return referrer_url;
    }

    /**
     * @param referrer_url
     *            the referrer_url to set
     */
    public void setReferrer_url(String referrer_url) {
        this.referrer_url = referrer_url;
    }

    /**
     * @return the logo_path
     */
    public String getLogo_path() {
        return logo_path;
    }

    /**
     * @param logo_path
     *            the logo_path to set
     */
    public void setLogo_path(String logo_path) {
        this.logo_path = logo_path;
    }

    /**
     * @return the background_path
     */
    public String getBackground_path() {
        return background_path;
    }

    /**
     * @param background_path
     *            the background_path to set
     */
    public void setBackground_path(String background_path) {
        this.background_path = background_path;
    }

    /**
     * @return the search_valid_date
     */
    public int getSearch_valid_date() {
        return search_valid_date;
    }

    /**
     * @param search_valid_date
     *            the search_valid_date to set
     */
    public void setSearch_valid_date(int search_valid_date) {
        this.search_valid_date = search_valid_date;
    }

    /**
     * @return the lcc_airline_list
     */
    public String getLcc_airline_list() {
        return lcc_airline_list;
    }

    /**
     * @param lcc_airline_list
     *            the lcc_airline_list to set
     */
    public void setLcc_airline_list(String lcc_airline_list) {
        this.lcc_airline_list = lcc_airline_list;
    }

    /**
     * @return the display_hotel
     */
    public int getDisplay_hotel() {
        return display_hotel;
    }

    /**
     * @param display_hotel
     *            the display_hotel to set
     */
    public void setDisplay_hotel(int display_hotel) {
        this.display_hotel = display_hotel;
    }

    /**
     * @return the display_rental_car
     */
    public int getDisplay_rental_car() {
        return display_rental_car;
    }

    /**
     * @param display_rental_car
     *            the display_rental_car to set
     */
    public void setDisplay_rental_car(int display_rental_car) {
        this.display_rental_car = display_rental_car;
    }

    /**
     * @return the display_local_transportation
     */
    public int getDisplay_local_transportation() {
        return display_local_transportation;
    }

    /**
     * @param display_local_transportation
     *            the display_local_transportation to set
     */
    public void setDisplay_local_transportation(int display_local_transportation) {
        this.display_local_transportation = display_local_transportation;
    }

    /**
     * @return the display_visa_service
     */
    public int getDisplay_visa_service() {
        return display_visa_service;
    }

    /**
     * @param display_visa_service
     *            the display_visa_service to set
     */
    public void setDisplay_visa_service(int display_visa_service) {
        this.display_visa_service = display_visa_service;
    }

    /**
     * @return the display_wifi
     */
    public int getDisplay_wifi() {
        return display_wifi;
    }

    /**
     * @param display_wifi
     *            the display_wifi to set
     */
    public void setDisplay_wifi(int display_wifi) {
        this.display_wifi = display_wifi;
    }

    /**
     * @return the display_insurance
     */
    public int getDisplay_insurance() {
        return display_insurance;
    }

    /**
     * @param display_insurance
     *            the display_insurance to set
     */
    public void setDisplay_insurance(int display_insurance) {
        this.display_insurance = display_insurance;
    }

    /**
     * @return the display_other1
     */
    public String getDisplay_other1() {
        return display_other1;
    }

    /**
     * @param display_other1
     *            the display_other1 to set
     */
    public void setDisplay_other1(String display_other1) {
        this.display_other1 = display_other1;
    }

    /**
     * @return the display_other2
     */
    public String getDisplay_other2() {
        return display_other2;
    }

    /**
     * @param display_other2
     *            the display_other2 to set
     */
    public void setDisplay_other2(String display_other2) {
        this.display_other2 = display_other2;
    }

    /**
     * @return the footer_html
     */
    public String getFooter_html() {
        return footer_html;
    }

    /**
     * @param footer_html
     *            the footer_html to set
     */
    public void setFooter_html(String footer_html) {
        this.footer_html = footer_html;
    }

    /**
     * @return the norification_html
     */
    public String getNorification_html() {
        return norification_html;
    }

    /**
     * @param norification_html
     *            the norification_html to set
     */
    public void setNorification_html(String norification_html) {
        this.norification_html = norification_html;
    }

    /**
     * @return the to
     */
    public String getTo() {
        return to;
    }

    /**
     * @param to
     *            the to to set
     */
    public void setTo(String to) {
        this.to = to;
    }

    /**
     * @return the bcc
     */
    public String getBcc() {
        return bcc;
    }

    /**
     * @param bcc
     *            the bcc to set
     */
    public void setBcc(String bcc) {
        this.bcc = bcc;
    }

    /**
     * @return the signature
     */
    public String getSignature() {
        return signature;
    }

    /**
     * @param signature
     *            the signature to set
     */
    public void setSignature(String signature) {
        this.signature = signature;
    }

    /**
     * @return the delete_flg
     */
    public int getDelete_flg() {
        return delete_flg;
    }

    /**
     * @param delete_flg
     *            the delete_flg to set
     */
    public void setDelete_flg(int delete_flg) {
        this.delete_flg = delete_flg;
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
