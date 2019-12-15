package com.infini.ccache.api.entity;

import java.util.Date;

// TODO: Auto-generated Javadoc
/**
 * The Class UserInfo.
 */
public class UserInfo {
    
    /** The id. */
    private String id;
    
    /** The pcc. */
    private String pcc;
    
    /** The company name. */
    private String companyName;
    
    /** The ip. */
    private String ip;
    
    /** The enable password. */
    private int enablePassword;
    
    /** The password. */
    private String password;
    
    /** The created time. */
    private String createdTime;
    
    /** The last updated time. */
    private String lastUpdatedTime;
    
    /** The token. */
    private String token;
    
    /** The time createtoken. */
    private Date timeCreateToken;
    
    /**
	 * @return the token
	 */
	public String getToken() {
		return token;
	}

	/**
	 * @param token the token to set
	 */
	public void setToken(String token) {
		this.token = token;
	}

	/**
	 * @return the timeCreateToken
	 */
	public Date getTimeCreateToken() {
		return timeCreateToken;
	}

	/**
	 * @param timeCreateToken the timeCreateToken to set
	 */
	public void setTimeCreateToken(Date timeCreateToken) {
		this.timeCreateToken = timeCreateToken;
	}

	/**
     * Gets the id.
     *
     * @return the id
     */
    public String getId() {
        return id;
    }
    
    /**
     * Sets the id.
     *
     * @param id the new id
     */
    public void setId(String id) {
        this.id = id;
    }
    
    /**
     * Gets the pcc.
     *
     * @return the pcc
     */
    public String getPcc() {
        return pcc;
    }
    
    /**
     * Sets the pcc.
     *
     * @param pcc the new pcc
     */
    public void setPcc(String pcc) {
        this.pcc = pcc;
    }
    
    /**
     * Gets the company name.
     *
     * @return the company name
     */
    public String getCompanyName() {
        return companyName;
    }
    
    /**
     * Sets the company name.
     *
     * @param companyName the new company name
     */
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
    
    /**
     * Gets the ip.
     *
     * @return the ip
     */
    public String getIp() {
        return ip;
    }
    
    /**
     * Sets the ip.
     *
     * @param ip the new ip
     */
    public void setIp(String ip) {
        this.ip = ip;
    }
    
    /**
     * Gets the enable password.
     *
     * @return the enable password
     */
    public int getEnablePassword() {
        return enablePassword;
    }
    
    /**
     * Sets the enable password.
     *
     * @param enablePassword the new enable password
     */
    public void setEnablePassword(int enablePassword) {
        this.enablePassword = enablePassword;
    }
    
    /**
     * Gets the password.
     *
     * @return the password
     */
    public String getPassword() {
        return password;
    }
    
    /**
     * Sets the password.
     *
     * @param password the new password
     */
    public void setPassword(String password) {
        this.password = password;
    }
    
    /**
     * Gets the created time.
     *
     * @return the created time
     */
    public String getCreatedTime() {
        return createdTime;
    }
    
    /**
     * Sets the created time.
     *
     * @param createdTime the new created time
     */
    public void setCreatedTime(String createdTime) {
        this.createdTime = createdTime;
    }
    
    /**
     * Gets the last updated time.
     *
     * @return the last updated time
     */
    public String getLastUpdatedTime() {
        return lastUpdatedTime;
    }
    
    /**
     * Sets the last updated time.
     *
     * @param lastUpdatedTime the new last updated time
     */
    public void setLastUpdatedTime(String lastUpdatedTime) {
        this.lastUpdatedTime = lastUpdatedTime;
    }
}
