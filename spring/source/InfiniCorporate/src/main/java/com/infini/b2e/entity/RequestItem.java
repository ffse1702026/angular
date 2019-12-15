package com.infini.b2e.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "request_item")
public class RequestItem {
    @Id
    private String request_id;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    @JoinColumn(name = "agent_id", referencedColumnName = "agent_id", insertable = true, updatable = true)
    private UserAgent agent_id;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    @JoinColumn(name = "corporate_id", referencedColumnName = "corporate_id", insertable = true, updatable = true)
    private UserCorporate corporate_id;

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

    private Date created_date;

    private Date last_updated_date;
    
    @OneToMany(mappedBy = "request_id", cascade=CascadeType.MERGE)
    private List<RequestFlight> listRequestFlight;

    @OneToMany(mappedBy = "request_id", cascade=CascadeType.MERGE)
    private List<RequestPassenger> listRequestPassenger;

    public RequestItem() {
        super();
    }

    /**
     * @return the request_id
     */
    public String getRequest_id() {
        return request_id;
    }

    /**
     * @param request_id
     *            the request_id to set
     */
    public void setRequest_id(String request_id) {
        this.request_id = request_id;
    }

    /**
     * @return the agent_id
     */
    public UserAgent getAgent_id() {
        return agent_id;
    }

    /**
     * @param agent_id
     *            the agent_id to set
     */
    public void setAgent_id(UserAgent agent_id) {
        this.agent_id = agent_id;
    }

    /**
     * @return the corporate_id
     */
    public UserCorporate getCorporate_id() {
        return corporate_id;
    }

    /**
     * @param corporate_id
     *            the corporate_id to set
     */
    public void setCorporate_id(UserCorporate corporate_id) {
        this.corporate_id = corporate_id;
    }

    /**
     * @return the requestor_name
     */
    public String getRequestor_name() {
        return requestor_name;
    }

    /**
     * @param requestor_name
     *            the requestor_name to set
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
     * @param requestor_phone
     *            the requestor_phone to set
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
     * @param to
     *            the to to set
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
     * @param cc
     *            the cc to set
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
     * @param num_of_adt
     *            the num_of_adt to set
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
     * @param num_of_cnn
     *            the num_of_cnn to set
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
     * @param num_of_ins
     *            the num_of_ins to set
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
     * @param num_of_inf
     *            the num_of_inf to set
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
     * @param request_type
     *            the request_type to set
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
     * @param prefer_condition
     *            the prefer_condition to set
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
     * @param prefer_class
     *            the prefer_class to set
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
     * @param prefer_fare
     *            the prefer_fare to set
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
     * @param changeable
     *            the changeable to set
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
     * @param refundable
     *            the refundable to set
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
     * @param other_request
     *            the other_request to set
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
     * @param free_text
     *            the free_text to set
     */
    public void setFree_text(String free_text) {
        this.free_text = free_text;
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

    /**
     * @return the listRequestFlight
     */
    public List<RequestFlight> getListRequestFlight() {
        return listRequestFlight;
    }

    /**
     * @param listRequestFlight the listRequestFlight to set
     */
    public void setListRequestFlight(List<RequestFlight> listRequestFlight) {
        this.listRequestFlight = listRequestFlight;
    }

    /**
     * @return the listRequestPassenger
     */
    public List<RequestPassenger> getListRequestPassenger() {
        return listRequestPassenger;
    }

    /**
     * @param listRequestPassenger the listRequestPassenger to set
     */
    public void setListRequestPassenger(List<RequestPassenger> listRequestPassenger) {
        this.listRequestPassenger = listRequestPassenger;
    }

}
