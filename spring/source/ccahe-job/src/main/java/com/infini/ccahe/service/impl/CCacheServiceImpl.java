package com.infini.ccahe.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.infini.ccahe.common.Constant;
import com.infini.ccahe.dto.BargainFinderMaxRQDto;
import com.infini.ccahe.dto.SessionCloseRQDto;
import com.infini.ccahe.dto.SessionCreateRQDto;
import com.infini.ccahe.entity.CCacheTask;
import com.infini.ccahe.entity.MgmtCacheTiming;
import com.infini.ccahe.entity.MgmtConfig;
import com.infini.ccahe.entity.RqCondition;
import com.infini.ccahe.entity.RsFareComponent;
import com.infini.ccahe.entity.RsFarebasi;
import com.infini.ccahe.entity.RsHiddenStop;
import com.infini.ccahe.entity.RsSegComponent;
import com.infini.ccahe.entity.RsSegment;
import com.infini.ccahe.entity.RsTax;
import com.infini.ccahe.entity.RsTaxComponent;
import com.infini.ccahe.repository.CCacheTaskRepository;
import com.infini.ccahe.repository.FileInfoRepository;
import com.infini.ccahe.repository.LogCacheRepository;
import com.infini.ccahe.repository.MgmtCacheTimingRepository;
import com.infini.ccahe.repository.MgmtConfigRepository;
import com.infini.ccahe.repository.RqConditionRepository;
import com.infini.ccahe.repository.RsFareComponentRepository;
import com.infini.ccahe.repository.RsFarebasiRepository;
import com.infini.ccahe.repository.RsSegComponentRepository;
import com.infini.ccahe.repository.RsSegmentRepository;
import com.infini.ccahe.repository.RsHiddenStopRepository;
import com.infini.ccahe.repository.RsTaxComponentRepository;
import com.infini.ccahe.repository.RsTaxRepository;
import com.infini.ccahe.requesttask.CCacheRequestTask;
import com.infini.ccahe.service.CCacheService;
import com.infini.ccahe.service.FileInfoService;
import com.infini.ccahe.utils.CSVUtils;
import com.infini.ccahe.utils.FileUtils;
import com.infini.ccahe.utils.SWSUtils;
import com.infini.ccahe.utils.ZIPUtils;

import java.util.concurrent.CompletionService;
import java.util.concurrent.ExecutorCompletionService;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class CCacheServiceImpl implements CCacheService {
	private static final Logger logger = LoggerFactory.getLogger(CCacheServiceImpl.class);
	private static final String XML_SESSIONCREATERQ_FILE = "xmltemplate/SessionCreateRQ.xml";
	private static final String XML_BARGAINFINDERMAX_ADRQ_FILE = "xmltemplate/BargainFinderMax_ADRQ.xml";
	private static final String XML_SESSIONCLOSERQ_FILE = "xmltemplate/SessionCloseRQ.xml";
	private static final String SWS_DEFAULT_METHOD_REQUEST = "POST";
	private static final String SWS_DEFAULT_CONTENT_TYPE_REQUEST = "text/xml; charset=utf-8";
	private static final String FORMAT_DATE_PATTERN_DEFAULT = "yyyy-MM-dd";
	private static final String FORMAT_TIME_PATTERN_DEFAULT = "HH:mm";
	private static final DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");

	@Autowired
	private MgmtCacheTimingRepository mgmtCacheTimingRepository;

	@Autowired
	private MgmtConfigRepository mgmtConfigRepository;

	@Autowired
	private CCacheTaskRepository ccacheTaskRepository;

	@Autowired
	private RqConditionRepository rqConditionRepository;

	@Autowired
	private RsFarebasiRepository rsFarebasiRepository;

	@Autowired
	private RsFareComponentRepository rsFareComponentRepository;

	@Autowired
	private RsSegComponentRepository rsSegComponentRepository;

	@Autowired
	private RsSegmentRepository rsSegmentRepository;

	@Autowired
	private RsHiddenStopRepository rsHiddenStopRepository;

	@Autowired
	private RsTaxComponentRepository rsTaxComponentRepository;

	@Autowired
	private RsTaxRepository rsTaxRepository;

	@Autowired
	private LogCacheRepository logCacheRepository;
	
	@Autowired
	private FileInfoRepository fileInfoRepository;
	
	private FileInfoService fileInfoService;

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

	@Override
	public void executeWithMultiThread() throws Exception {
		MgmtCacheTiming cacheTiming = _getCacheTiming();

		if (!_checkAlowRun(cacheTiming)) {
			// return;
		}

		FileUtils fileUtils = new FileUtils();

		this.sessionCreateRQ = fileUtils.getRequestXML(XML_SESSIONCREATERQ_FILE);
		this.bargainFinderMax_ADRQ = fileUtils.getRequestXML(XML_BARGAINFINDERMAX_ADRQ_FILE);
		this.sessionCloseRQ = fileUtils.getRequestXML(XML_SESSIONCLOSERQ_FILE);

		MgmtConfig config = _getConfig();
		SWSUtils swsUtils = new SWSUtils();

		SessionCreateRQDto sessionCreateRQDto = _getSessionCreateRQDto(config);
		String connectResponse = swsUtils.connectWithSessionCreateRQ(this.sessionCreateRQ, sessionCreateRQDto);
		logger.info("Connect SWS successfuly :: " + connectResponse);

		List<CCacheTask> tasks = _getRunTasks();

		int numOfSessions = cacheTiming.getNumOfSessions();
		ExecutorService executorService = Executors.newFixedThreadPool(numOfSessions);
		CompletionService<Boolean> executor = new ExecutorCompletionService<>(executorService);
		List<Future<Boolean>> futures = new ArrayList<Future<Boolean>>();

		for (int i = 0; i < tasks.size(); i++) {
			if (futures.size() < numOfSessions) {
				BargainFinderMaxRQDto bargainFinderMaxRQDto = _getBargainFinderMaxRQDto(connectResponse, config,
						tasks.get(i));
				CCacheRequestTask cacheRequest = new CCacheRequestTask(bargainFinderMax_ADRQ, bargainFinderMaxRQDto,
						rqConditionRepository, rsFarebasiRepository, rsFareComponentRepository,
						rsSegComponentRepository, rsSegmentRepository, rsHiddenStopRepository, rsTaxComponentRepository,
						rsTaxRepository, logCacheRepository);
				futures.add(executor.submit(cacheRequest));
				tasks.remove(i);
				i--;
			}
		}

		for (int i = 0; i < futures.size(); i++) {
			try {
				Boolean result = executor.take().get();
				logger.info("Thread Stoped " + i + ": " + result + " :: Stoped Time - {}",
						dateTimeFormatter.format(LocalDateTime.now()));
				if (tasks.size() > 0) {
					BargainFinderMaxRQDto bargainFinderMaxRQDto = _getBargainFinderMaxRQDto(connectResponse, config,
							tasks.get(0));
					CCacheRequestTask cacheRequestNext = new CCacheRequestTask(bargainFinderMax_ADRQ,
							bargainFinderMaxRQDto, rqConditionRepository, rsFarebasiRepository,
							rsFareComponentRepository, rsSegComponentRepository, rsSegmentRepository,
							rsHiddenStopRepository, rsTaxComponentRepository, rsTaxRepository, logCacheRepository);
					futures.add(executor.submit(cacheRequestNext));
					tasks.remove(0);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		executorService.shutdown();

		SessionCloseRQDto sessionCloseRQDto = _getSessionCloseRQDto(connectResponse, config);
		String disconnectResponse = swsUtils.disconnectWithSessionCloseRQ(this.sessionCloseRQ, sessionCloseRQDto);
		logger.info("Disconnect SWS successfuly :: " + disconnectResponse);
		// ZIP file
		_exportDataToZip();
	}

	private MgmtCacheTiming _getCacheTiming() {
		List<MgmtCacheTiming> mgmtCacheTimings = (List<MgmtCacheTiming>) mgmtCacheTimingRepository.findAll();

		if (mgmtCacheTimings != null && mgmtCacheTimings.size() > 0) {
			return mgmtCacheTimings.get(0);
		}

		return null;
	}

	private MgmtConfig _getConfig() {

		List<MgmtConfig> mgmtConfigs = (List<MgmtConfig>) mgmtConfigRepository.findAll();

		if (mgmtConfigs != null && mgmtConfigs.size() > 0) {
			return mgmtConfigs.get(0);
		}

		return null;
	}

	private boolean _checkAlowRun(MgmtCacheTiming cacheTiming) {
		if (cacheTiming == null) {
			return false;
		}

		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(FORMAT_TIME_PATTERN_DEFAULT);
		String currentHourMinute = dateTimeFormatter.format(LocalDateTime.now());
		if (currentHourMinute.equals(cacheTiming.getStartTime1())) {
			return true;
		} else if (currentHourMinute.equals(cacheTiming.getStartTime2())) {
			return true;
		} else if (currentHourMinute.equals(cacheTiming.getStartTime3())) {
			return true;
		}

		return false;
	}

	private List<CCacheTask> _getRunTasks() {
		List<CCacheTask> tasks = ccacheTaskRepository.getTasks();
		return tasks;
	}

	private SessionCreateRQDto _getSessionCreateRQDto(MgmtConfig config) {
		SessionCreateRQDto sessionCreateRQDto = new SessionCreateRQDto();
		sessionCreateRQDto.setUserName(config.getUsername());
		sessionCreateRQDto.setPassword(config.getPassword());
		sessionCreateRQDto.setPseudoCityCode(config.getPseudoCityCode());
		sessionCreateRQDto.setSwsUrl(config.getSwsUrl());
		sessionCreateRQDto.setSwsMethodRequest(SWS_DEFAULT_METHOD_REQUEST);
		sessionCreateRQDto.setSwsContentType(SWS_DEFAULT_CONTENT_TYPE_REQUEST);

		return sessionCreateRQDto;
	}

	private BargainFinderMaxRQDto _getBargainFinderMaxRQDto(String binarySecurityToken, MgmtConfig config,
			CCacheTask task) {
		BargainFinderMaxRQDto bargainFinderMaxRQDto = new BargainFinderMaxRQDto();
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(FORMAT_DATE_PATTERN_DEFAULT);

		bargainFinderMaxRQDto.setBinarySecurityToken(binarySecurityToken);
		bargainFinderMaxRQDto.setPseudoCityCode(config.getPseudoCityCode());
		bargainFinderMaxRQDto.setSwsUrl(config.getSwsUrl());
		bargainFinderMaxRQDto.setSwsMethodRequest(SWS_DEFAULT_METHOD_REQUEST);
		bargainFinderMaxRQDto.setSwsContentType(SWS_DEFAULT_CONTENT_TYPE_REQUEST);

		String patternId = task.getId().getPatternId();
		String outboundDateFrom = dateTimeFormatter.format(LocalDateTime.now().plusDays(task.getOutboundDateFrom()));
		String outboundDateTo = dateTimeFormatter.format(LocalDateTime.now().plusDays(task.getOutboundDateTo()));
		String outboundDateType = task.getId().getOutboundDateType();
		String outboundTimeFrom = task.getOutboundTimeFrom();
		String outboundTimeTo = task.getOutboundTimeTo();
		String outboundTimePosition = task.getId().getOutboundTimePosition();
		String departureAirport = task.getDepartureAirport();
		String arrivalAirport = task.getArrivalAirport();
		String stayDay = Short.toString(task.getId().getStayDay());
		String inboundTimeFrom = task.getInboundTimeFrom();
		String inboundTimeTo = task.getInboundTimeTo();
		String inboundTimePosition = task.getId().getInboundTimePosition();
		String carrier = task.getCarrier();
		String stops = Short.toString(task.getStops());
		String cabin = task.getId().getCabin();
		String excludeCodeshare = task.getExcludeCodeshare() == 1 ? "true" : "false";
		String freePiece = task.getFreePiece() == 1 ? "true" : "fasle";
		String seat = Integer.toString((int) task.getNumOfAdt() + (int) task.getNumOfCnn() + (int) task.getNumOfIns()
				+ (int) task.getNumOfInf());
		String numOfAdt = Short.toString(task.getNumOfAdt());
		String numOfCnn = Short.toString(task.getNumOfCnn());
		String numOfIns = Short.toString(task.getNumOfIns());
		String numOfInf = Short.toString(task.getNumOfInf());

		bargainFinderMaxRQDto.setPatternId(patternId);
		bargainFinderMaxRQDto.setOutboundDateFrom(outboundDateFrom);
		bargainFinderMaxRQDto.setOutboundDateTo(outboundDateTo);
		bargainFinderMaxRQDto.setOutboundDateType(outboundDateType);
		bargainFinderMaxRQDto.setOutboundTimeFrom(outboundTimeFrom);
		bargainFinderMaxRQDto.setOutboundTimeTo(outboundTimeTo);
		bargainFinderMaxRQDto.setOutboundTimePosition(outboundTimePosition);
		bargainFinderMaxRQDto.setDepartureAirport(departureAirport);
		bargainFinderMaxRQDto.setArrivalAirport(arrivalAirport);
		bargainFinderMaxRQDto.setStayDay(stayDay);
		bargainFinderMaxRQDto.setInboundTimeFrom(inboundTimeFrom);
		bargainFinderMaxRQDto.setInboundTimeTo(inboundTimeTo);
		bargainFinderMaxRQDto.setInboundTimePosition(inboundTimePosition);
		bargainFinderMaxRQDto.setCarrier(carrier);
		bargainFinderMaxRQDto.setStops(stops);
		bargainFinderMaxRQDto.setCabin(cabin);
		bargainFinderMaxRQDto.setExcludeCodeshare(excludeCodeshare);
		bargainFinderMaxRQDto.setFreePiece(freePiece);
		bargainFinderMaxRQDto.setSeat(seat);
		bargainFinderMaxRQDto.setNumOfAdt(numOfAdt);
		bargainFinderMaxRQDto.setNumOfCnn(numOfCnn);
		bargainFinderMaxRQDto.setNumOfIns(numOfIns);
		bargainFinderMaxRQDto.setNumOfInf(numOfInf);

		return bargainFinderMaxRQDto;
	}

	private SessionCloseRQDto _getSessionCloseRQDto(String binarySecurityToken, MgmtConfig config) {
		SessionCloseRQDto sessionCloseRQDto = new SessionCloseRQDto();
		sessionCloseRQDto.setBinarySecurityToken(binarySecurityToken);
		sessionCloseRQDto.setPseudoCityCode(config.getPseudoCityCode());
		sessionCloseRQDto.setSwsUrl(config.getSwsUrl());
		sessionCloseRQDto.setSwsMethodRequest(SWS_DEFAULT_METHOD_REQUEST);
		sessionCloseRQDto.setSwsContentType(SWS_DEFAULT_CONTENT_TYPE_REQUEST);

		return sessionCloseRQDto;
	}

	private void _exportDataToZip() throws Exception {
		
		this.fileInfoService = new FileInfoServiceImpl(fileInfoRepository);
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern(Constant.FORMAT_DATE);
		String currentDate = dateFormatter.format(now);
		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern(Constant.FORMAT_TIME);
		String currentTime = timeFormatter.format(now);

		String directory = path;

		_exportRqConditionToCSV(directory, currentDate, currentTime);
		_exportRsSegComponentToCSV(directory, currentDate, currentTime);
		_exportRsFareComponentToCSV(directory, currentDate, currentTime);
		_exportRsFarebasiToCSV(directory, currentDate, currentTime);
		_exportRsTaxComponentToCSV(directory, currentDate, currentTime);
		_exportRsSegmentToCSV(directory, currentDate, currentTime);
		_exportRsHiddenStopToCSV(directory, currentDate, currentTime);
		_exportRsTaxToCSV(directory, currentDate, currentTime);

		ZIPUtils zipUtils = new ZIPUtils();
		String fileName = "/CalendarCache_" + currentDate + "_" + currentTime + "_001.zip";
		String zipOutputFile = directory + fileName;
		String uploadkey = folder + fileName;
		zipUtils.createZipCsvFile(directory, zipOutputFile);
		
		//Upload file to S3
		s3.upload(zipOutputFile, uploadkey.replaceAll("\\\\", "/"));
		
		this.fileInfoService.insertFileInfo(uploadkey.replaceAll("\\\\", "/"));
		
		// Delete file zip after upload
		zipUtils._deleteFileZip(zipOutputFile);
	}
	
	private void _exportRqConditionToCSV(String directory, String currentDate, String currentTime) throws Exception {
		CSVUtils csvUtils = new CSVUtils();
		List<RqCondition> rqConditions = (List<RqCondition>) rqConditionRepository.findAll();
		String csvFilePath = directory + "/01_Request_" + currentDate + "_" + currentTime + "_001.csv";

		csvUtils.createCSV(csvFilePath);
		csvUtils.writeCSVLine(Arrays.asList("CacheID", "OriginLocation", "DestinationLocation", "VendorCode", "OutboundFromDate", "OutboundDepartureFromTime", "OutboundDepartureToTime", "InboundDepartureFromTime", "InboundDepartureToTime", "LengthOfStay", "MaxConnctions", "Cabin", "QuantityADT", "QuantityCNN", "QuantityINS", "QuantityINF", "TypeOperating", "FreePieceRequired"));
		for (RqCondition rqCondition : rqConditions) {
			List<String> lineExport = new ArrayList<String>();
			lineExport.add(rqCondition.getId().getCacheId());
			lineExport.add(rqCondition.getDepartureAirport());
			lineExport.add(rqCondition.getArrivalAirport());
			lineExport.add(rqCondition.getCarrier());
			lineExport.add(rqCondition.getOutboundDateFrom());
			lineExport.add(rqCondition.getOutboundDateTo());
			lineExport.add(rqCondition.getOutboundTimeFrom());
			lineExport.add(rqCondition.getOutboundTimeTo());
			lineExport.add(rqCondition.getInboundTimeFrom());
			lineExport.add(rqCondition.getInboundTimeTo());
			lineExport.add(rqCondition.getInboundTimeFrom());
			lineExport.add(String.valueOf(rqCondition.getStaydays()));
			lineExport.add(String.valueOf(rqCondition.getStops()));
			lineExport.add(rqCondition.getCabin());
			lineExport.add(String.valueOf(rqCondition.getNumOfAdt()));
			lineExport.add(String.valueOf(rqCondition.getNumOfCnn()));
			lineExport.add(String.valueOf(rqCondition.getNumOfIns()));
			lineExport.add(String.valueOf(rqCondition.getNumOfInf()));
			lineExport.add(rqCondition.getExcludeCodeshare());
			lineExport.add(rqCondition.getFreePiece());
			csvUtils.writeCSVLine(lineExport);
		}
		csvUtils.saveCSV();
	}

	private void _exportRsSegComponentToCSV(String directory, String currentDate, String currentTime) throws Exception {
		CSVUtils csvUtils = new CSVUtils();
		List<RsSegComponent> rsSegComponents = (List<RsSegComponent>) rsSegComponentRepository.findAll();
		String csvFilePath = directory + "/02_SegComponent_" + currentDate + "_" + currentTime + "_001.csv";

		csvUtils.createCSV(csvFilePath);
		csvUtils.writeCSVLine(Arrays.asList("CacheID", "ItineraryID", "SegmentNo", "Direction", "DepartureDate", "ScheduleID"));
		for (RsSegComponent rsSegComponent : rsSegComponents) {
			List<String> lineExport = new ArrayList<String>();
			lineExport.add(rsSegComponent.getId().getCacheId());
			lineExport.add(String.valueOf(rsSegComponent.getId().getItineraryId()));
			lineExport.add(String.valueOf(rsSegComponent.getId().getSegmentNo()));
			lineExport.add(rsSegComponent.getDirection());
			lineExport.add(rsSegComponent.getDepartureDate());
			lineExport.add(String.valueOf(rsSegComponent.getScheduleId()));
			csvUtils.writeCSVLine(lineExport);
		}
		csvUtils.saveCSV();
	}
	
	private void _exportRsFareComponentToCSV(String directory, String currentDate, String currentTime) throws Exception {
		CSVUtils csvUtils = new CSVUtils();
		List<RsFareComponent> rsFareComponents = (List<RsFareComponent>) rsFareComponentRepository.findAll();
		String csvFilePath = directory + "/03_FareComponent_" + currentDate + "_" + currentTime + "_001.csv";

		csvUtils.createCSV(csvFilePath);
		csvUtils.writeCSVLine(Arrays.asList("CacheID", "ItineraryID", "PassengerType", "ValidatingCarrier", "LastTicketDate", "TotalFare", "TotalTaxes", "BaseFareAmount", "NonRefundable", "PenaltyExchangeBefore", "PenaltyExchangeAfter", "PenaltyRefundBefore", "PenaltyRefundAfter"));
		for (RsFareComponent rsFareComponent : rsFareComponents) {
			List<String> lineExport = new ArrayList<String>();
			lineExport.add(rsFareComponent.getId().getCacheId());
			lineExport.add(String.valueOf(rsFareComponent.getId().getItineraryId()));
			lineExport.add(String.valueOf(rsFareComponent.getId().getPassengerType()));
			lineExport.add(rsFareComponent.getValidatingCarrier());
			lineExport.add(rsFareComponent.getLastTicketDate());
			lineExport.add(String.valueOf(rsFareComponent.getTotalFare()));
			lineExport.add(String.valueOf(rsFareComponent.getTotalTax()));
			lineExport.add(String.valueOf(rsFareComponent.getBaseFare()));
			lineExport.add(rsFareComponent.getNonRefundable());
			lineExport.add(String.valueOf(rsFareComponent.getExchangeBefore()));
			lineExport.add(String.valueOf(rsFareComponent.getExchangeAfter()));
			lineExport.add(String.valueOf(rsFareComponent.getRefundBefore()));
			lineExport.add(String.valueOf(rsFareComponent.getRefundAfter()));

			csvUtils.writeCSVLine(lineExport);
		}
		csvUtils.saveCSV();
	}

	private void _exportRsFarebasiToCSV(String directory, String currentDate, String currentTime) throws Exception {
		CSVUtils csvUtils = new CSVUtils();
		List<RsFarebasi> rsFarebasis = (List<RsFarebasi>) rsFarebasiRepository.findAll();
		String csvFilePath = directory + "/04_FAREBASIS_" + currentDate + "_" + currentTime + "_001.csv";

		csvUtils.createCSV(csvFilePath);
		csvUtils.writeCSVLine(Arrays.asList("CacheID", "ItineraryID", "PassengerType", "SegmentNo", "Cabin", "SeatsAvailable", "RBD", "FareBasis", "AvailabilityBreak", "BaggageProvisionType"));
		for (RsFarebasi rsFarebasi : rsFarebasis) {
			List<String> lineExport = new ArrayList<String>();
			lineExport.add(rsFarebasi.getId().getCacheId());
			lineExport.add(String.valueOf(rsFarebasi.getId().getItineraryId()));
			lineExport.add(String.valueOf(rsFarebasi.getId().getPassengerType()));
			lineExport.add(String.valueOf(rsFarebasi.getId().getSegmentNo()));
			lineExport.add(rsFarebasi.getCabin());
			lineExport.add(String.valueOf(rsFarebasi.getSeatsAvailable()));
			lineExport.add(rsFarebasi.getRbd());
			lineExport.add(rsFarebasi.getFarebasis());
			lineExport.add(rsFarebasi.getAvailabilityBreak());
			lineExport.add(rsFarebasi.getBaggage());

			csvUtils.writeCSVLine(lineExport);
		}
		csvUtils.saveCSV();
	}
	
	private void _exportRsTaxComponentToCSV(String directory, String currentDate, String currentTime) throws Exception {
		CSVUtils csvUtils = new CSVUtils();
		List<RsTaxComponent> rsTaxComponents = (List<RsTaxComponent>) rsTaxComponentRepository.findAll();
		String csvFilePath = directory + "/05_TaxComponent_" + currentDate + "_" + currentTime + "_001.csv";

		csvUtils.createCSV(csvFilePath);
		csvUtils.writeCSVLine(Arrays.asList("CacheID", "ItineraryID", "PassengerType", "TaxID"));
		for (RsTaxComponent rsTaxComponent : rsTaxComponents) {
			List<String> lineExport = new ArrayList<String>();
			lineExport.add(rsTaxComponent.getId().getCacheId());
			lineExport.add(String.valueOf(rsTaxComponent.getId().getItineraryId()));
			lineExport.add(String.valueOf(rsTaxComponent.getId().getPassengerType()));
			lineExport.add(String.valueOf(rsTaxComponent.getId().getTaxId()));

			csvUtils.writeCSVLine(lineExport);
		}
		csvUtils.saveCSV();
	}
	
	private void _exportRsSegmentToCSV(String directory, String currentDate, String currentTime) throws Exception {
		CSVUtils csvUtils = new CSVUtils();
		List<RsSegment> rsSegments = (List<RsSegment>) rsSegmentRepository.findAll();
		String csvFilePath = directory + "/06_Segment_" + currentDate + "_" + currentTime + "_001.csv";

		csvUtils.createCSV(csvFilePath);
		csvUtils.writeCSVLine(Arrays.asList("CacheID", "ScheduleID", "Stops", "DepartureAirport", "DepartureTime", "ArrivalAirport", "ArrivalTime", "DateAdjustment", "MarketingCarrier", "MarketingFlightNumber", "OperatingCarrier", "OperatingFlightNumber"));
		for (RsSegment rsSegment : rsSegments) {
			List<String> lineExport = new ArrayList<String>();
			lineExport.add(rsSegment.getId().getCacheId());
			lineExport.add(String.valueOf(rsSegment.getId().getScheduleId()));
			lineExport.add(String.valueOf(rsSegment.getStops()));
			lineExport.add(rsSegment.getDepartureAirport());
			lineExport.add(rsSegment.getDepartureTime());
			lineExport.add(rsSegment.getArrivalAirport());
			lineExport.add(rsSegment.getArrivalTime());
			lineExport.add(String.valueOf(rsSegment.getDateAdjustment()));
			lineExport.add(rsSegment.getMarketingCarrier());
			lineExport.add(rsSegment.getMarketingFlightNumber());
			lineExport.add(rsSegment.getOperatingCarrier());
			lineExport.add(rsSegment.getOperatingFlightNumber());

			csvUtils.writeCSVLine(lineExport);
		}
		csvUtils.saveCSV();
	}
	
	private void _exportRsHiddenStopToCSV(String directory, String currentDate, String currentTime) throws Exception {
		CSVUtils csvUtils = new CSVUtils();
		List<RsHiddenStop> rsHiddenStops = (List<RsHiddenStop>) rsHiddenStopRepository.findAll();
		String csvFilePath = directory + "/07_HiddenStop_" + currentDate + "_" + currentTime + "_001.csv";

		csvUtils.createCSV(csvFilePath);
		csvUtils.writeCSVLine(Arrays.asList("CacheID", "ScheduleID", "HiddenStopID", "HiddenStopAirport", "HiddenStopArrivalTime", "HiddenStopArrivalDateAdjustment", "HiddenStopDepartureTime", "HiddenStopDepartureDateAdjustment"));
		for (RsHiddenStop rsHiddenStop : rsHiddenStops) {
			List<String> lineExport = new ArrayList<String>();
			lineExport.add(rsHiddenStop.getId().getCacheId());
			lineExport.add(String.valueOf(rsHiddenStop.getId().getScheduleId()));
			lineExport.add(String.valueOf(rsHiddenStop.getId().getHiddenStopId()));
			lineExport.add(rsHiddenStop.getHiddenStopAirport());
			lineExport.add(rsHiddenStop.getHiddenStopArrivalTime());
			lineExport.add(String.valueOf(rsHiddenStop.getHiddenStopArrivalDateAdjustment()));
			lineExport.add(rsHiddenStop.getHiddenStopDepartureTime());
			lineExport.add(String.valueOf(rsHiddenStop.getHiddenStopDepartureDateAdjustment()));

			csvUtils.writeCSVLine(lineExport);
		}
		csvUtils.saveCSV();
	}
	
	private void _exportRsTaxToCSV(String directory, String currentDate, String currentTime) throws Exception {
		CSVUtils csvUtils = new CSVUtils();
		List<RsTax> rsTaxs = (List<RsTax>) rsTaxRepository.findAll();
		String csvFilePath = directory + "/08_TAX_" + currentDate + "_" + currentTime + "_001.csv";

		csvUtils.createCSV(csvFilePath);
		csvUtils.writeCSVLine(Arrays.asList("CacheID", "TaxID", "TaxCode", "TaxAmount"));
		for (RsTax rsTax : rsTaxs) {
			List<String> lineExport = new ArrayList<String>();
			lineExport.add(rsTax.getId().getCacheId());
			lineExport.add(String.valueOf(rsTax.getId().getTaxId()));
			lineExport.add(rsTax.getId().getCode());
			lineExport.add(rsTax.getAmount());

			csvUtils.writeCSVLine(lineExport);
		}
		csvUtils.saveCSV();
	}
}
