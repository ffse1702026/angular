package com.infini.b2e.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="mst_country")
public class MstCountry {
    @Id
    private int id;
    private String carrier_code;
    private String country_name_jp;
    private String carrier_name_en;
    private String yobi1;
    private String yobi2;
    private String yobi3;
    private String yobi4;
    private String yobi5;
    private boolean delete_flg;
    private Date created_date;
    private Date last_updated_date;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id
     *            the id to set
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
     * @param carrier_code
     *            the carrier_code to set
     */
    public void setCarrier_code(String carrier_code) {
        this.carrier_code = carrier_code;
    }

    /**
     * @return the country_name_jp
     */
    public String getCountry_name_jp() {
        return country_name_jp;
    }

    /**
     * @param country_name_jp
     *            the country_name_jp to set
     */
    public void setCountry_name_jp(String country_name_jp) {
        this.country_name_jp = country_name_jp;
    }

    /**
     * @return the carrier_name_en
     */
    public String getCarrier_name_en() {
        return carrier_name_en;
    }

    /**
     * @param carrier_name_en
     *            the carrier_name_en to set
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
     * @param yobi1
     *            the yobi1 to set
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
     * @param yobi2
     *            the yobi2 to set
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
     * @param yobi3
     *            the yobi3 to set
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
     * @param yobi4
     *            the yobi4 to set
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
     * @param yobi5
     *            the yobi5 to set
     */
    public void setYobi5(String yobi5) {
        this.yobi5 = yobi5;
    }

    /**
     * @return the delete_flg
     */
    public boolean isDelete_flg() {
        return delete_flg;
    }

    /**
     * @param delete_flg
     *            the delete_flg to set
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
