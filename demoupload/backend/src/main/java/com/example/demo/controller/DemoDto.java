package com.example.demo.controller;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class DemoDto implements Serializable {
	
	private MultipartFile[] file;
	private String name;
	

	public DemoDto(MultipartFile[] file, String name) {
		super();
		this.file = file;
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public MultipartFile[] getFile() {
		return file;
	}

	public void setFile(MultipartFile[] file) {
		this.file = file;
	}

	public DemoDto(MultipartFile[] file) {
		super();
		this.file = file;
	}

	public DemoDto() {
		super();
	}
	
	
	

}
