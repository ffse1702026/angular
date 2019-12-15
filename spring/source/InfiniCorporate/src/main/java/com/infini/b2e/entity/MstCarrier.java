package com.infini.b2e.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="mst_carrier")
public class MstCarrier {
    @Id
    private int id;
    
    private String carrier_code;
    
    private String country_code;
    
    private String carrier_name_jp;
    
    private String carrier_name_en;
    
    private String yobi1;
    
    private String yobi2;
    
    private String yobi3;
    
    private String yobi4;
    
    private String yobi5;
    
    private String delete_flg;
    
    private String created_date;
    
    private String last_updated_date;
    
    public MstCarrier() {
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
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
     * @return the country_code
     */
    public String getCountry_code() {
        return country_code;
    }

    /**
     * @param country_code the country_code to set
     */
    public void setCountry_code(String country_code) {
        this.country_code = country_code;
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

    /**
     * @return the carrier_name_en
     */
    public String getCarrier_name_en() {
        return carrier_name_en;
    }

    /**
     * @param carrier_name_en the carrier_name_en to set
     */
    public void setCarrier_name_en(String carrier_name_en) {
        this.carrier_name_en = carrier_name_en;
    }

    /**
     * @return the yobi1
     */
    public String getYobi1() {
        return yobi1;
    }

    /**
     * @param yobi1 the yobi1 to set
     */
    public void setYobi1(String yobi1) {
        this.yobi1 = yobi1;
    }

    /**
     * @return the yobi2
     */
    public String getYobi2() {
        return yobi2;
    }

    /**
     * @param yobi2 the yobi2 to set
     */
    public void setYobi2(String yobi2) {
        this.yobi2 = yobi2;
    }

    /**
     * @return the yobi3
     */
    public String getYobi3() {
        return yobi3;
    }

    /**
     * @param yobi3 the yobi3 to set
     */
    public void setYobi3(String yobi3) {
        this.yobi3 = yobi3;
    }

    /**
     * @return the yobi4
     */
    public String getYobi4() {
        return yobi4;
    }

    /**
     * @param yobi4 the yobi4 to set
     */
    public void setYobi4(String yobi4) {
        this.yobi4 = yobi4;
    }

    /**
     * @return the yobi5
     */
    public String getYobi5() {
        return yobi5;
    }

    /**
     * @param yobi5 the yobi5 to set
     */
    public void setYobi5(String yobi5) {
        this.yobi5 = yobi5;
    }

    /**
     * @return the delete_flg
     */
    public String getDelete_flg() {
        return delete_flg;
    }

    /**
     * @param delete_flg the delete_flg to set
     */
    public void setDelete_flg(String delete_flg) {
        this.delete_flg = delete_flg;
    }

    /**
     * @return the created_date
     */
    public String getCreated_date() {
        return created_date;
    }

    /**
     * @param created_date the created_date to set
     */
    public void setCreated_date(String created_date) {
        this.created_date = created_date;
    }

    /**
     * @return the last_updated_date
     */
    public String getLast_updated_date() {
        return last_updated_date;
    }

    /**
     * @param last_updated_date the last_updated_date to set
     */
    public void setLast_updated_date(String last_updated_date) {
        this.last_updated_date = last_updated_date;
    }
    
    
    
}
