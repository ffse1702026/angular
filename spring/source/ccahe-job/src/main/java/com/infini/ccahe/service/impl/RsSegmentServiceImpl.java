package com.infini.ccahe.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import com.infini.ccahe.common.Constant;
import com.infini.ccahe.entity.RsSegment;
import com.infini.ccahe.entity.RsSegmentPK;
import com.infini.ccahe.repository.RsSegmentRepository;
import com.infini.ccahe.responsetask.model.Arrival;
import com.infini.ccahe.responsetask.model.Carrier;
import com.infini.ccahe.responsetask.model.Departure;
import com.infini.ccahe.responsetask.model.GroupedItineraryResponse;
import com.infini.ccahe.responsetask.model.ScheduleDesc;
import com.infini.ccahe.service.RsSegmentService;
import com.infini.ccahe.utils.StringUtils;

public class RsSegmentServiceImpl implements RsSegmentService {
	private RsSegmentRepository rsSegmentRepository;
	
	public RsSegmentServiceImpl() {
	}

	public RsSegmentServiceImpl(RsSegmentRepository rsSegmentRepository) {
		this.rsSegmentRepository = rsSegmentRepository;
	}

	@Override
	public int deleteRsSegmentByCacheId(String cacheId) {
		try {
			if (!StringUtils.isNullOrEmpty(cacheId)) {
				List<RsSegment> rsSegments = this.rsSegmentRepository.findAllByCacheId(cacheId);
				if (rsSegments != null) {
					this.rsSegmentRepository.deleteAll(rsSegments);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}

	@Override
	public int insertRsSegment(String cacheId, GroupedItineraryResponse responseObj) {
		try {
			List<ScheduleDesc> scheduleDescs = responseObj.getScheduleDescs();
			for (ScheduleDesc scheduleDesc : scheduleDescs) {
				List<Departure> departures = scheduleDesc.getDepartures();
				List<Arrival> arrivals = scheduleDesc.getArrivals();
				List<Carrier> carriers = scheduleDesc.getCarriers();
				for (int i = 0; i < departures.size(); i++) {
					DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(Constant.FORMAT_DATE_TIME);
					String currentTime = dateTimeFormatter.format(LocalDateTime.now());
					
					RsSegmentPK rsSegmentPK = new RsSegmentPK();
					rsSegmentPK.setCacheId(cacheId);
					rsSegmentPK.setScheduleId(Short.valueOf(String.valueOf(scheduleDesc.getId())));
					
					RsSegment rsSegment = new RsSegment();
					rsSegment.setId(rsSegmentPK);
					rsSegment.setStops(Short.valueOf(scheduleDesc.getStops()));
					rsSegment.setDepartureAirport(departures.get(i).getAirport());
					rsSegment.setDepartureTime(departures.get(i).getTime());
					rsSegment.setArrivalAirport(arrivals.get(i).getAirport());
					rsSegment.setArrivalTime(arrivals.get(i).getTime());
					if(arrivals.get(i).getDateAdjustment() != null) {
						rsSegment.setDateAdjustment(Short.valueOf(arrivals.get(i).getDateAdjustment()));
					}
					rsSegment.setMarketingCarrier(carriers.get(i).getMarketing());
					rsSegment.setMarketingFlightNumber(carriers.get(i).getMarketingFlightNumber());
					rsSegment.setOperatingCarrier(carriers.get(i).getOperating());
					rsSegment.setOperatingFlightNumber(carriers.get(i).getOperatingFlightNumber());
					rsSegment.setCreatedTime(currentTime);
					rsSegment.setLastUpdatedTime(currentTime);
					
					this.rsSegmentRepository.save(rsSegment);
				}
			}
			
			return 1;
		} catch (Exception e) {
			//return 0;
			e.printStackTrace();
		}
		return 0;
	}
}
