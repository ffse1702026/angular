package com.infini.ccahe.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import com.infini.ccahe.common.Constant;
import com.infini.ccahe.entity.RsFarebasi;
import com.infini.ccahe.entity.RsFarebasiPK;
import com.infini.ccahe.entity.RsTaxComponent;
import com.infini.ccahe.entity.RsTaxComponentPK;
import com.infini.ccahe.repository.RsTaxComponentRepository;
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
import com.infini.ccahe.responsetask.model.Tax;
import com.infini.ccahe.responsetask.model.TaxDesc;
import com.infini.ccahe.service.RsTaxComponentService;
import com.infini.ccahe.utils.StringUtils;

public class RsTaxComponentServiceImpl implements RsTaxComponentService {
	private RsTaxComponentRepository rsTaxComponentRepository;
	
	public RsTaxComponentServiceImpl() {
	}

	public RsTaxComponentServiceImpl(RsTaxComponentRepository rsTaxComponentRepository) {
		this.rsTaxComponentRepository = rsTaxComponentRepository;
	}

	@Override
	public int deleteRsTaxComponentByCacheId(String cacheId) {
		try {
			if (!StringUtils.isNullOrEmpty(cacheId)) {
				List<RsTaxComponent> rsTaxComponents = this.rsTaxComponentRepository.findAllByCacheId(cacheId);
				if (rsTaxComponents != null) {
					this.rsTaxComponentRepository.deleteAll(rsTaxComponents);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}

	@Override
	public int insertRsTaxComponent(String cacheId, GroupedItineraryResponse responseObj) {
		try {
			List<ItineraryGroup> itineraryGroups = responseObj.getItineraryGroups();
			List<TaxDesc> taxDescs = responseObj.getTaxDescs();
			int itineraryId = 1;
			for (ItineraryGroup itineraryGroup : itineraryGroups) {
				List<Itinerary> itinerarys = itineraryGroup.getItineraries();
				for (Itinerary itinerary : itinerarys) {
					List<PricingInformation> pricingInformations = itinerary.getPricingInformations();
					for (PricingInformation pricingInformation : pricingInformations) {
						List<Fare> fares = pricingInformation.getFares();
						for (Fare fare : fares) {
							List<PassengerInfo> passengerInfos = fare.getPassengerInfos();
							for (PassengerInfo passengerInfo : passengerInfos) {
								List<Tax> taxs = passengerInfo.getTaxs();
								for (Tax tax : taxs) {
									DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(Constant.FORMAT_DATE_TIME);
									String currentTime = dateTimeFormatter.format(LocalDateTime.now());
									
									RsTaxComponentPK rsTaxComponentPK = new RsTaxComponentPK();
									rsTaxComponentPK.setCacheId(cacheId);
									rsTaxComponentPK.setItineraryId(Short.valueOf(String.valueOf(itineraryId)));
									rsTaxComponentPK.setPassengerType(passengerInfo.getPassengerType());
									rsTaxComponentPK.setTaxId(Short.valueOf(_getTaxId(tax.getRef(), taxDescs)));
									
									RsTaxComponent rsTaxComponent = new RsTaxComponent();
									rsTaxComponent.setId(rsTaxComponentPK);
									rsTaxComponent.setCreatedTime(currentTime);
									rsTaxComponent.setLastUpdatedTime(currentTime);
									
									rsTaxComponentRepository.save(rsTaxComponent);
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
	
	private String _getTaxId(String taxRef, List<TaxDesc> taxDescs) {
		for (TaxDesc taxDesc : taxDescs) {
			if(taxDesc.getId().equals(taxRef)) {
				return taxDesc.getId();
			}
		}
		
		return "";
	}
}
