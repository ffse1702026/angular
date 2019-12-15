package com.infini.b2e.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;


import com.infini.b2e.dto.BargainFinderMaxRQDto;
import com.infini.b2e.dto.SessionCloseRQDto;
import com.infini.b2e.dto.SessionCreateRQDto;

import com.infini.b2e.utils.CSVUtils;
import com.infini.b2e.utils.FileUtils;
import com.infini.b2e.utils.SWSUtils;
import com.infini.b2e.utils.ZIPUtils;

import java.util.concurrent.CompletionService;
import java.util.concurrent.ExecutorCompletionService;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class CCacheServiceImpl  {
	private static final Logger logger = LoggerFactory.getLogger(CCacheServiceImpl.class);
	private static final String XML_SESSIONCREATERQ_FILE = "xmltemplate/SessionCreateRQ.xml";
	private static final String XML_BARGAINFINDERMAX_ADRQ_FILE = "xmltemplate/BargainFinderMax_ADRQ.xml";
	private static final String XML_SESSIONCLOSERQ_FILE = "xmltemplate/SessionCloseRQ.xml";
	private static final String SWS_DEFAULT_METHOD_REQUEST = "POST";
	private static final String SWS_DEFAULT_CONTENT_TYPE_REQUEST = "text/xml; charset=utf-8";
	private static final String FORMAT_DATE_PATTERN_DEFAULT = "yyyy-MM-dd";
	private static final String FORMAT_TIME_PATTERN_DEFAULT = "HH:mm";
	private static final DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");



	private String sessionCreateRQ;

	private String bargainFinderMax_ADRQ;

	private String sessionCloseRQ;
	
    @Autowired
    private S3Wrapper s3;

    @Value("${app.path}")
    private String path;
    
    @Value("${app.folder}")
    private String folder;

	public CCacheServiceImpl() {
	}

	public void executeWithMultiThread() throws Exception {




		FileUtils fileUtils = new FileUtils();

		this.sessionCreateRQ = fileUtils.getRequestXML(XML_SESSIONCREATERQ_FILE);
		this.bargainFinderMax_ADRQ = fileUtils.getRequestXML(XML_BARGAINFINDERMAX_ADRQ_FILE);
		this.sessionCloseRQ = fileUtils.getRequestXML(XML_SESSIONCLOSERQ_FILE);


		SWSUtils swsUtils = new SWSUtils();

		SessionCreateRQDto sessionCreateRQDto = _getSessionCreateRQDto();
		String connectResponse = swsUtils.connectWithSessionCreateRQ(this.sessionCreateRQ, sessionCreateRQDto);
		logger.info("Connect SWS successfuly :: " + connectResponse);

		SessionCloseRQDto sessionCloseRQDto = _getSessionCloseRQDto(connectResponse);
		String disconnectResponse = swsUtils.disconnectWithSessionCloseRQ(this.sessionCloseRQ, sessionCloseRQDto);
		logger.info("Disconnect SWS successfuly :: " + disconnectResponse);
		// ZIP file

	}




	private SessionCreateRQDto _getSessionCreateRQDto() {
		SessionCreateRQDto sessionCreateRQDto = new SessionCreateRQDto();
		sessionCreateRQDto.setUserName("");
		sessionCreateRQDto.setPassword("");
		sessionCreateRQDto.setPseudoCityCode("");
		sessionCreateRQDto.setSwsUrl("");
		sessionCreateRQDto.setSwsMethodRequest(SWS_DEFAULT_METHOD_REQUEST);
		sessionCreateRQDto.setSwsContentType(SWS_DEFAULT_CONTENT_TYPE_REQUEST);

		return sessionCreateRQDto;
	}

    /*
     * private BargainFinderMaxRQDto _getBargainFinderMaxRQDto(String
     * binarySecurityToken) { BargainFinderMaxRQDto bargainFinderMaxRQDto = new
     * BargainFinderMaxRQDto(); DateTimeFormatter dateTimeFormatter =
     * DateTimeFormatter.ofPattern(FORMAT_DATE_PATTERN_DEFAULT);
     * 
     * bargainFinderMaxRQDto.setBinarySecurityToken(binarySecurityToken);
     * bargainFinderMaxRQDto.setPseudoCityCode("");
     * bargainFinderMaxRQDto.setSwsUrl("");
     * bargainFinderMaxRQDto.setSwsMethodRequest(SWS_DEFAULT_METHOD_REQUEST);
     * bargainFinderMaxRQDto.setSwsContentType(SWS_DEFAULT_CONTENT_TYPE_REQUEST);
     * 
     * String patternId = task.getId().getPatternId(); String outboundDateFrom =
     * dateTimeFormatter.format(LocalDateTime.now().plusDays(task.
     * getOutboundDateFrom())); String outboundDateTo =
     * dateTimeFormatter.format(LocalDateTime.now().plusDays(task.getOutboundDateTo(
     * ))); String outboundDateType = task.getId().getOutboundDateType(); String
     * outboundTimeFrom = task.getOutboundTimeFrom(); String outboundTimeTo =
     * task.getOutboundTimeTo(); String outboundTimePosition =
     * task.getId().getOutboundTimePosition(); String departureAirport =
     * task.getDepartureAirport(); String arrivalAirport = task.getArrivalAirport();
     * String stayDay = Short.toString(task.getId().getStayDay()); String
     * inboundTimeFrom = task.getInboundTimeFrom(); String inboundTimeTo =
     * task.getInboundTimeTo(); String inboundTimePosition =
     * task.getId().getInboundTimePosition(); String carrier = task.getCarrier();
     * String stops = Short.toString(task.getStops()); String cabin =
     * task.getId().getCabin(); String excludeCodeshare = task.getExcludeCodeshare()
     * == 1 ? "true" : "false"; String freePiece = task.getFreePiece() == 1 ? "true"
     * : "fasle"; String seat = Integer.toString((int) task.getNumOfAdt() + (int)
     * task.getNumOfCnn() + (int) task.getNumOfIns() + (int) task.getNumOfInf());
     * String numOfAdt = Short.toString(task.getNumOfAdt()); String numOfCnn =
     * Short.toString(task.getNumOfCnn()); String numOfIns =
     * Short.toString(task.getNumOfIns()); String numOfInf =
     * Short.toString(task.getNumOfInf());
     * 
     * bargainFinderMaxRQDto.setPatternId(patternId);
     * bargainFinderMaxRQDto.setOutboundDateFrom(outboundDateFrom);
     * bargainFinderMaxRQDto.setOutboundDateTo(outboundDateTo);
     * bargainFinderMaxRQDto.setOutboundDateType(outboundDateType);
     * bargainFinderMaxRQDto.setOutboundTimeFrom(outboundTimeFrom);
     * bargainFinderMaxRQDto.setOutboundTimeTo(outboundTimeTo);
     * bargainFinderMaxRQDto.setOutboundTimePosition(outboundTimePosition);
     * bargainFinderMaxRQDto.setDepartureAirport(departureAirport);
     * bargainFinderMaxRQDto.setArrivalAirport(arrivalAirport);
     * bargainFinderMaxRQDto.setStayDay(stayDay);
     * bargainFinderMaxRQDto.setInboundTimeFrom(inboundTimeFrom);
     * bargainFinderMaxRQDto.setInboundTimeTo(inboundTimeTo);
     * bargainFinderMaxRQDto.setInboundTimePosition(inboundTimePosition);
     * bargainFinderMaxRQDto.setCarrier(carrier);
     * bargainFinderMaxRQDto.setStops(stops); bargainFinderMaxRQDto.setCabin(cabin);
     * bargainFinderMaxRQDto.setExcludeCodeshare(excludeCodeshare);
     * bargainFinderMaxRQDto.setFreePiece(freePiece);
     * bargainFinderMaxRQDto.setSeat(seat);
     * bargainFinderMaxRQDto.setNumOfAdt(numOfAdt);
     * bargainFinderMaxRQDto.setNumOfCnn(numOfCnn);
     * bargainFinderMaxRQDto.setNumOfIns(numOfIns);
     * bargainFinderMaxRQDto.setNumOfInf(numOfInf);
     * 
     * return bargainFinderMaxRQDto; }
     */

	private SessionCloseRQDto _getSessionCloseRQDto(String binarySecurityToken) {
		SessionCloseRQDto sessionCloseRQDto = new SessionCloseRQDto();
		sessionCloseRQDto.setBinarySecurityToken(binarySecurityToken);
		sessionCloseRQDto.setPseudoCityCode("");
		sessionCloseRQDto.setSwsUrl("");
		sessionCloseRQDto.setSwsMethodRequest(SWS_DEFAULT_METHOD_REQUEST);
		sessionCloseRQDto.setSwsContentType(SWS_DEFAULT_CONTENT_TYPE_REQUEST);
		return sessionCloseRQDto;
	}

	
}
