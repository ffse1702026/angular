package com.infini.b2e.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="mst_alliance")
public class MstAlliance {
    
    @Id
    private String id;
    
    private String carrier_code;
    
    private String alliance_code;
    
    private boolean delete_flg;
    
    private Date created_date;
    
    private Date last_updated_date;

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the carrier_code
     */
    public String getCarrier_code() {
        return carrier_code;
    }

    /**
     * @param carrier_code the carrier_code to set
     */
    public void setCarrier_code(String carrier_code) {
        this.carrier_code = carrier_code;
    }

    /**
     * @return the alliance_code
     */
    public String getAlliance_code() {
        return alliance_code;
    }

    /**
     * @param alliance_code the alliance_code to set
     */
    public void setAlliance_code(String alliance_code) {
        this.alliance_code = alliance_code;
    }

    /**
     * @return the delete_flg
     */
    public boolean isDelete_flg() {
        return delete_flg;
    }

    /**
     * @param delete_flg the delete_flg to set
     */
    public void setDelete_flg(boolean delete_flg) {
        this.delete_flg = delete_flg;
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

}
