package com.infini.ccahe.service;

import com.infini.ccahe.dto.BargainFinderMaxRQDto;

public interface LogCacheService {
	public int insertLogCache(String requestXML, BargainFinderMaxRQDto requestDto, String requestId, String responseXML);
}
