package com.infini.ccahe.requesttask;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.Callable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.infini.ccahe.dto.BargainFinderMaxRQDto;
import com.infini.ccahe.entity.RqCondition;
import com.infini.ccahe.repository.LogCacheRepository;
import com.infini.ccahe.repository.RqConditionRepository;
import com.infini.ccahe.repository.RsFareComponentRepository;
import com.infini.ccahe.repository.RsFarebasiRepository;
import com.infini.ccahe.repository.RsSegComponentRepository;
import com.infini.ccahe.repository.RsSegmentRepository;
import com.infini.ccahe.repository.RsHiddenStopRepository;
import com.infini.ccahe.repository.RsTaxComponentRepository;
import com.infini.ccahe.repository.RsTaxRepository;
import com.infini.ccahe.responsetask.CCacheResponseTask;
import com.infini.ccahe.responsetask.model.GroupedItineraryResponse;
import com.infini.ccahe.service.LogCacheService;
import com.infini.ccahe.service.RqConditionService;
import com.infini.ccahe.service.RsFareComponentService;
import com.infini.ccahe.service.RsFarebasiService;
import com.infini.ccahe.service.RsSegComponentService;
import com.infini.ccahe.service.RsSegmentService;
import com.infini.ccahe.service.RsHiddenStopService;
import com.infini.ccahe.service.RsTaxComponentService;
import com.infini.ccahe.service.RsTaxService;
import com.infini.ccahe.service.impl.LogCacheServiceImpl;
import com.infini.ccahe.service.impl.RqConditionServiceImpl;
import com.infini.ccahe.service.impl.RsFareComponentServiceImpl;
import com.infini.ccahe.service.impl.RsFarebasiServiceImpl;
import com.infini.ccahe.service.impl.RsSegComponentServiceImpl;
import com.infini.ccahe.service.impl.RsSegmentServiceImpl;
import com.infini.ccahe.service.impl.RsHiddenStopServiceImpl;
import com.infini.ccahe.service.impl.RsTaxComponentServiceImpl;
import com.infini.ccahe.service.impl.RsTaxServiceImpl;
import com.infini.ccahe.utils.SWSUtils;

public class CCacheRequestTask implements Callable<Boolean> {
	private static final Logger logger = LoggerFactory.getLogger(CCacheRequestTask.class);
	private static final DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");

	private String requestXML;
	
	private BargainFinderMaxRQDto requestDto;
	
	private RqConditionService rqConditionService;
	
	private RsFarebasiService rsFarebasiService;
	
	private RsFareComponentService rsFareComponentService;
	
	private RsSegComponentService rsSegComponentService;
	
	private RsSegmentService rsSegmentService;
	
	private RsHiddenStopService rsHiddenStopService;
	
	private RsTaxComponentService rsTaxComponentService;
	
	private RsTaxService rsTaxService;
	
	private LogCacheService logCacheService;
	
	public CCacheRequestTask() {}
	
	public CCacheRequestTask(
			String requestXML,
			BargainFinderMaxRQDto requestDto,
			RqConditionRepository rqConditionRepository,
			RsFarebasiRepository rsFarebasiRepository,
			RsFareComponentRepository rsFareComponentRepository,
			RsSegComponentRepository rsSegComponentRepository,
			RsSegmentRepository rsSegmentRepository,
			RsHiddenStopRepository rsHiddenStopRepository,
			RsTaxComponentRepository rsTaxComponentRepository,
			RsTaxRepository rsTaxRepository,
			LogCacheRepository logCacheRepository) {
		this.requestXML = requestXML;
		this.requestDto = requestDto;
		this.rqConditionService = new RqConditionServiceImpl(rqConditionRepository);
		this.rsFarebasiService = new RsFarebasiServiceImpl(rsFarebasiRepository);
		this.rsFareComponentService = new RsFareComponentServiceImpl(rsFareComponentRepository);
		this.rsSegComponentService = new RsSegComponentServiceImpl(rsSegComponentRepository);
		this.rsSegmentService = new RsSegmentServiceImpl(rsSegmentRepository);
		this.rsHiddenStopService = new RsHiddenStopServiceImpl(rsHiddenStopRepository);
		this.rsTaxComponentService = new RsTaxComponentServiceImpl(rsTaxComponentRepository);
		this.rsTaxService = new RsTaxServiceImpl(rsTaxRepository);
		this.logCacheService = new LogCacheServiceImpl(logCacheRepository);
	}

	@Override
	public Boolean call() {
		try {
			logger.info("Thread Started :: Started Time - {}", dateTimeFormatter.format(LocalDateTime.now()));
			
			SWSUtils swsUtils = new SWSUtils();
			CCacheResponseTask ccacheResponse = new CCacheResponseTask();
			
			String requestId = _getRequestId(requestDto);
			String cacheId = _getCacheId(requestId);
			
			_deleteByRequestId(requestId);
			_insertRqCondition(cacheId, requestId);
			
			String xmlResponseCompressed = swsUtils.getDataWithBargainFinderMax_ADRQ(requestXML, requestDto);
			GroupedItineraryResponse responseObj = ccacheResponse.executeResponse(xmlResponseCompressed);
			_insertDatabase(cacheId, responseObj);
			_insertLogCache(requestXML, requestDto, requestId, xmlResponseCompressed);
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	private String _getCacheId(String requestId) {
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
		String currentTime = dateTimeFormatter.format(LocalDateTime.now());
		StringBuffer cacheId = new StringBuffer();
		cacheId.append(currentTime);
		cacheId.append("_");
		cacheId.append(requestId);
		
		return cacheId.toString();
	}
	
	private String _getRequestId(BargainFinderMaxRQDto requestDto) {
		StringBuffer requestId = new StringBuffer();
		requestId.append(requestDto.getPatternId());
		requestId.append("_");
		requestId.append(requestDto.getOutboundDateType());
		requestId.append(String.format("%02d", Integer.valueOf(requestDto.getStayDay())));
		requestId.append(requestDto.getCabin());
		requestId.append(requestDto.getStops());
		requestId.append(requestDto.getNumOfAdt());
		requestId.append(requestDto.getNumOfCnn());
		requestId.append(requestDto.getNumOfIns());
		requestId.append(requestDto.getNumOfInf());
		requestId.append(requestDto.getOutboundTimePosition());
		requestId.append(requestDto.getInboundTimePosition());
		requestId.append(requestDto.getExcludeCodeshare().equals("true") ? "1" : "0");
		
		return requestId.toString();
	}
	
	private void _deleteByRequestId(String requestId) {
		RqCondition rqCondition = this.rqConditionService.getRqConditionByRequestId(requestId);
		if (rqCondition != null) {
			String cacheId = rqCondition.getId().getCacheId();
			this.rqConditionService.deleteRqCondition(rqCondition);
			this.rsFarebasiService.deleteRsFarebasiByCacheId(cacheId);
			this.rsFareComponentService.deleteRsFareComponentByCacheId(cacheId);
			this.rsSegComponentService.deleteRsSegComponentByCacheId(cacheId);
			this.rsSegmentService.deleteRsSegmentByCacheId(cacheId);
			this.rsHiddenStopService.deleteRsHiddenStopByCacheId(cacheId);
			this.rsTaxComponentService.deleteRsTaxComponentByCacheId(cacheId);
			this.rsTaxService.deleteRsTaxByCacheId(cacheId);
		}
	}
	
	private void _insertRqCondition(String cacheId, String requestId) {
		this.rqConditionService.insertRqCondition(cacheId, requestId, requestDto);
	}
	
	private void _insertDatabase(String cacheId, GroupedItineraryResponse responseObj) {
		this.rsSegmentService.insertRsSegment(cacheId, responseObj);
		this.rsSegComponentService.insertRsSegComponent(cacheId, responseObj);
		this.rsFarebasiService.insertRsFarebasi(cacheId, responseObj);
		this.rsFareComponentService.insertRsFareComponent(cacheId, responseObj);
		this.rsHiddenStopService.insertRsHiddenStop(cacheId, responseObj);
		this.rsTaxService.insertRsTax(cacheId, responseObj);
		this.rsTaxComponentService.insertRsTaxComponent(cacheId, responseObj);
	}
	
	private void _insertLogCache(String requestXML, BargainFinderMaxRQDto requestDto, String requestId, String responseXML) {
		this.logCacheService.insertLogCache(requestXML, requestDto, requestId, responseXML);
	}
}
