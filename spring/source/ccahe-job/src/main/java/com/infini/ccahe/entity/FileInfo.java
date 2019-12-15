package com.infini.ccahe.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the file_info database table.
 * 
 */
@Entity
@Table(name="file_info")
@NamedQuery(name="FileInfo.findAll", query="SELECT f FROM FileInfo f")
public class FileInfo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private short id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_date_time")
	private Date createdDateTime;

	@Column(name="file_path")
	private String filePath;

	public FileInfo() {
	}

	public short getId() {
		return this.id;
	}

	public void setId(short id) {
		this.id = id;
	}

	public Date getCreatedDateTime() {
		return this.createdDateTime;
	}

	public void setCreatedDateTime(Date createdDateTime) {
		this.createdDateTime = createdDateTime;
	}

	public String getFilePath() {
		return this.filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

}