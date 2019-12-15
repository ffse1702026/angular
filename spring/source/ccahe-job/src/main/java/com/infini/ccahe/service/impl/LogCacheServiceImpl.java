package com.infini.ccahe.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.infini.ccahe.common.Constant;
import com.infini.ccahe.dto.BargainFinderMaxRQDto;
import com.infini.ccahe.entity.LogCache;
import com.infini.ccahe.repository.LogCacheRepository;
import com.infini.ccahe.service.LogCacheService;

public class LogCacheServiceImpl implements LogCacheService {
	private LogCacheRepository logCacheRepository;
	
	public LogCacheServiceImpl() {
	}
	
	public LogCacheServiceImpl(LogCacheRepository logCacheRepository) {
		this.logCacheRepository = logCacheRepository;
	}

	@Override
	public int insertLogCache(String requestXML, BargainFinderMaxRQDto requestDto, String requestId, String responseXML) {
		try {
			DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(Constant.FORMAT_DATE_TIME);
			String currentTime = dateTimeFormatter.format(LocalDateTime.now());
			
			LogCache logCache = new LogCache();
			logCache.setCacheTime(currentTime);
			logCache.setPatternId(requestDto.getPatternId());
			logCache.setRequestId(requestId);
			logCache.setCarrier(requestDto.getCarrier());
			logCache.setDepartureAirport(requestDto.getDepartureAirport());
			logCache.setArrivalAirport(requestDto.getArrivalAirport());
			logCache.setOutboundDateFrom(requestDto.getOutboundDateFrom());
			logCache.setOutboundDateTo(requestDto.getOutboundDateTo());
			logCache.setDuration(Short.valueOf("1"));
			logCache.setStops(Short.valueOf(requestDto.getStops()));
			logCache.setOutboundTime(requestDto.getOutboundTimeFrom());
			logCache.setInboundTime(requestDto.getInboundTimeFrom());
			logCache.setCabin(requestDto.getCabin());
			logCache.setExcludeCodeshare(Short.valueOf(requestDto.getExcludeCodeshare()));
			logCache.setRequestXml(requestXML);
			logCache.setResponseXml(responseXML);
			logCache.setErrorMsg("");
			logCache.setCreatedTime(currentTime);
			logCache.setLastUpdatedTime(currentTime);
			
			this.logCacheRepository.save(logCache);
			
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}

}
