package com.infini.ccahe.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import com.infini.ccahe.common.Constant;
import com.infini.ccahe.entity.RsSegComponent;
import com.infini.ccahe.entity.RsSegComponentPK;
import com.infini.ccahe.repository.RsSegComponentRepository;
import com.infini.ccahe.responsetask.model.GroupedItineraryResponse;
import com.infini.ccahe.responsetask.model.ItineraryGroup;
import com.infini.ccahe.responsetask.model.Leg;
import com.infini.ccahe.responsetask.model.LegDesc;
import com.infini.ccahe.responsetask.model.LegDescription;
import com.infini.ccahe.responsetask.model.Schedule;
import com.infini.ccahe.responsetask.model.ScheduleDesc;
import com.infini.ccahe.service.RsSegComponentService;
import com.infini.ccahe.utils.StringUtils;

public class RsSegComponentServiceImpl implements RsSegComponentService {
	private RsSegComponentRepository rsSegComponentRepository;
	
	public RsSegComponentServiceImpl() {
	}

	public RsSegComponentServiceImpl(RsSegComponentRepository rsSegComponentRepository) {
		this.rsSegComponentRepository = rsSegComponentRepository;
	}

	@Override
	public int deleteRsSegComponentByCacheId(String cacheId) {
		try {
			if (!StringUtils.isNullOrEmpty(cacheId)) {
				List<RsSegComponent> rsSegComponents = this.rsSegComponentRepository.findAllByCacheId(cacheId);
				if (rsSegComponents != null) {
					this.rsSegComponentRepository.deleteAll(rsSegComponents);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}

	@Override
	public int insertRsSegComponent(String cacheId, GroupedItineraryResponse responseObj) {
		try {
			List<ItineraryGroup> itineraryGroups = responseObj.getItineraryGroups();
			int itineraryId = 1;
			
			for (ItineraryGroup itineraryGroup : itineraryGroups) {
				List<LegDescription> legDescriptions = itineraryGroup.getGroupDescriptions().get(0).getLegDescriptions();
				List<Leg> legs = itineraryGroup.getItineraries().get(0).getLegs();
				int segmentNo = 1;
				
				for (int i = 0; i < legs.size(); i++) {
					LegDesc legDesc = _getLegDescByLegRef(legs.get(i).getRef(), responseObj.getLegDescs());
					
					for (Schedule schedule : legDesc.getSchedules()) {
						DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(Constant.FORMAT_DATE_TIME);
						String currentTime = dateTimeFormatter.format(LocalDateTime.now());
						
						RsSegComponentPK id = new RsSegComponentPK();
						RsSegComponent rsSegComponent = new RsSegComponent();
						
						id.setCacheId(cacheId);
						id.setItineraryId(Short.valueOf(String.valueOf(itineraryId)));
						id.setSegmentNo(Short.valueOf(String.valueOf(segmentNo)));					
						rsSegComponent.setId(id);
						rsSegComponent.setDepartureDate(legDescriptions.get(i).getDepartureDate());
						rsSegComponent.setDirection(_getDirection(i));
						rsSegComponent.setScheduleId(Short.valueOf(_getScheduleId(schedule.getRef(), responseObj.getScheduleDescs())));
						rsSegComponent.setCreatedTime(currentTime);
						rsSegComponent.setLastUpdatedTime(currentTime);
						
						rsSegComponentRepository.save(rsSegComponent);
						
						segmentNo++;
					}
				}
				itineraryId++;
			}
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}
	
	private String _getDirection(int index) {
		if(index == 0) {
			return Constant.OUTBOUND_DIRECTION;
		}
		
		return Constant.INBOUND_DIRECTION;
	}
	
	private LegDesc _getLegDescByLegRef(String legRef, List<LegDesc> legDescs) {
		for (LegDesc legDesc : legDescs) {
			if(legRef.equals(legDesc.getId())) {
				return legDesc;
			}
		}
		
		return null;
	}
	
	private String _getScheduleId(String scheduleRef, List<ScheduleDesc> scheduleDescs) {
		for (ScheduleDesc scheduleDesc : scheduleDescs) {
			if(scheduleDesc.getId().equals(scheduleRef)) {
				return scheduleDesc.getId();
			}
		}
		
		return null;
	}
}
