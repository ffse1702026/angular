package com.infini.b2e.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.validator.constraints.Length;

@Entity
@Table(name= "user_agent")
public class UserAgent {
	@Id
	@NotNull
	@Length(max=15)
	private String agent_id;
	
	@NotNull
	@Length(max=10)
	private String agent_name;
	
	@NotNull
	@Length(max=50)
	private String store_name;
	
	@Length(max=4)
	private String pcc;
	
	private String password;
	
	@Email
	private String mail_address;
	
	private String delete_flg;
	
	@CreationTimestamp
	private Date created_date;
	
	@UpdateTimestamp
	private Date last_updated_date;
	
	public UserAgent() {
		super();
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
     * @return the store_name
     */
    public String getStore_name() {
        return store_name;
    }

    /**
     * @param store_name the store_name to set
     */
    public void setStore_name(String store_name) {
        this.store_name = store_name;
    }

    /**
     * @return the pcc
     */
    public String getPcc() {
        return pcc;
    }

    /**
     * @param pcc the pcc to set
     */
    public void setPcc(String pcc) {
        this.pcc = pcc;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
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
     * @param mail_address the mail_address to set
     */
    public void setMail_address(String mail_address) {
        this.mail_address = mail_address;
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
