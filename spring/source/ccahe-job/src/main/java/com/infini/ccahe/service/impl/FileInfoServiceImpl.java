package com.infini.ccahe.service.impl;

import java.util.Date;

import com.infini.ccahe.entity.FileInfo;
import com.infini.ccahe.repository.FileInfoRepository;
import com.infini.ccahe.service.FileInfoService;

public class FileInfoServiceImpl implements FileInfoService{
	
	private FileInfoRepository fileInfoRepository;
	
	public FileInfoServiceImpl() {};
	
	public FileInfoServiceImpl(FileInfoRepository fileInfoRepository) {
		this.fileInfoRepository = fileInfoRepository;
	}

	@Override
	public int insertFileInfo(String filePath) {
		Date date = new Date();
		FileInfo fileInfo = new FileInfo();
		
		fileInfo.setCreatedDateTime(date);
		fileInfo.setFilePath(filePath);
		
		this.fileInfoRepository.save(fileInfo);
		return 0;
	}

}
