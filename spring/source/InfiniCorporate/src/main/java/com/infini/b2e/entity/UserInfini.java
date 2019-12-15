package com.infini.b2e.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_infini")
public class UserInfini {
    @Id
    private String user_id;
    
    private String password;

    private Date created_date;

    private Date last_updated_date;

    private boolean block_f;

    private Date last_modified;
    
    private Date last_password_update_date;

    private int attemp;

    public UserInfini() {
    }

    /**
     * @return the last_password_update_date
     */
    public Date getLast_password_update_date() {
        return last_password_update_date;
    }

    /**
     * @param last_password_update_date the last_password_update_date to set
     */
    public void setLast_password_update_date(Date last_password_update_date) {
        this.last_password_update_date = last_password_update_date;
    }

    /**
     * @return the block_f
     */
    public boolean isBlock_f() {
        return block_f;
    }

    /**
     * @param block_f
     *            the block_f to set
     */
    public void setBlock_f(boolean block_f) {
        this.block_f = block_f;
    }

    /**
     * @return the last_modified
     */
    public Date getLast_modified() {
        return last_modified;
    }

    /**
     * @param last_modified
     *            the last_modified to set
     */
    public void setLast_modified(Date last_modified) {
        this.last_modified = last_modified;
    }

    /**
     * @return the attemp
     */
    public int getAttemp() {
        return attemp;
    }

    /**
     * @param attemp
     *            the attemp to set
     */
    public void setAttemp(int attemp) {
        this.attemp = attemp;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    public Date getLast_updated_date() {
        return last_updated_date;
    }

    public void setLast_updated_date(Date last_updated_date) {
        this.last_updated_date = last_updated_date;
    }

}
