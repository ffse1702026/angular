package com.infini.ccahe.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import com.infini.ccahe.common.Constant;
import com.infini.ccahe.entity.RsFarebasi;
import com.infini.ccahe.entity.RsFarebasiPK;
import com.infini.ccahe.repository.RsFarebasiRepository;
import com.infini.ccahe.responsetask.model.BaggageInformation;
import com.infini.ccahe.responsetask.model.Fare;
import com.infini.ccahe.responsetask.model.FareComponent;
import com.infini.ccahe.responsetask.model.FareComponentDesc;
import com.infini.ccahe.responsetask.model.GroupedItineraryResponse;
import com.infini.ccahe.responsetask.model.Itinerary;
import com.infini.ccahe.responsetask.model.ItineraryGroup;
import com.infini.ccahe.responsetask.model.PassengerInfo;
import com.infini.ccahe.responsetask.model.PricingInformation;
import com.infini.ccahe.responsetask.model.Segment;
import com.infini.ccahe.service.RsFarebasiService;
import com.infini.ccahe.utils.StringUtils;

public class RsFarebasiServiceImpl implements RsFarebasiService {
	private RsFarebasiRepository rsFarebasiRepository;

	public RsFarebasiServiceImpl() {
	}

	public RsFarebasiServiceImpl(RsFarebasiRepository rsFarebasiRepository) {
		this.rsFarebasiRepository = rsFarebasiRepository;
	}

	@Override
	public int deleteRsFarebasiByCacheId(String cacheId) {
		try {
			if (!StringUtils.isNullOrEmpty(cacheId)) {				
				List<RsFarebasi> rsFarebasis = this.rsFarebasiRepository.findAllByCacheId(cacheId);
				if (rsFarebasis != null) {
					this.rsFarebasiRepository.deleteAll(rsFarebasis);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}

	@Override
	public int insertRsFarebasi(String cacheId, GroupedItineraryResponse responseObj) {
		try {
			List<ItineraryGroup> itineraryGroups = responseObj.getItineraryGroups();
			List<FareComponentDesc> fareComponentDescs = responseObj.getFareComponentDescs();
			int itineraryId = 1;
			for (ItineraryGroup itineraryGroup : itineraryGroups) {
				int segmentNo = 1;
				List<Itinerary> itinerarys = itineraryGroup.getItineraries();
				for (Itinerary itinerary : itinerarys) {
					List<PricingInformation> pricingInformations = itinerary.getPricingInformations();
					for (PricingInformation pricingInformation : pricingInformations) {
						List<Fare> fares = pricingInformation.getFares();
						for (Fare fare : fares) {
							List<PassengerInfo> passengerInfos = fare.getPassengerInfos();
							for (PassengerInfo passengerInfo : passengerInfos) {
								List<FareComponent> fareComponents = passengerInfo.getFareComponents();
								List<BaggageInformation> baggageInformations = passengerInfo.getBaggageInformations();
								int index = 0;
								for (FareComponent fareComponent : fareComponents) {
									List<Segment> segments = fareComponent.getSegments();
									for (Segment segment : segments) {
										DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(Constant.FORMAT_DATE_TIME);
										String currentTime = dateTimeFormatter.format(LocalDateTime.now());
										
										RsFarebasiPK rsFarebasiPK = new RsFarebasiPK();
										rsFarebasiPK.setCacheId(cacheId);
										rsFarebasiPK.setItineraryId(Short.valueOf(String.valueOf(itineraryId)));
										rsFarebasiPK.setPassengerType(passengerInfo.getPassengerType());
										rsFarebasiPK.setSegmentNo(Short.valueOf(String.valueOf(segmentNo)));
										segmentNo++;
										
										RsFarebasi rsFarebasi = new RsFarebasi();
										rsFarebasi.setId(rsFarebasiPK);
										rsFarebasi.setCabin(segment.getCabinCode());
										rsFarebasi.setSeatsAvailable(Short.valueOf(String.valueOf(segment.getSeatsAvailable())));
										rsFarebasi.setRbd(segment.getBookingCode());
										rsFarebasi.setFarebasis(_getFareBasisCode(fareComponent.getRef(), fareComponentDescs));
										rsFarebasi.setAvailabilityBreak(segment.getAvailabilityBreak());
										rsFarebasi.setBaggage(baggageInformations.get(index).getProvisionType());
										rsFarebasi.setCreatedTime(currentTime);
										rsFarebasi.setLastUpdatedTime(currentTime);
										
										rsFarebasiRepository.save(rsFarebasi);
									}
									index++;
								}
							}
						}
					}
					itineraryId++;
				}
			}
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}

	private String _getFareBasisCode(String fareComponentRef, List<FareComponentDesc> fareComponentDescs) {
		for (FareComponentDesc fareComponentDesc : fareComponentDescs) {
			if (fareComponentDesc.getId().equals(fareComponentRef)) {
				return fareComponentDesc.getFareBasisCode();
			}
		}
		
		return "";
	}
}
