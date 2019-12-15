package com.infini.ccahe.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import com.infini.ccahe.common.Constant;
import com.infini.ccahe.entity.RsHiddenStop;
import com.infini.ccahe.entity.RsHiddenStopPK;
import com.infini.ccahe.repository.RsHiddenStopRepository;
import com.infini.ccahe.responsetask.model.GroupedItineraryResponse;
import com.infini.ccahe.responsetask.model.HiddenStop;
import com.infini.ccahe.responsetask.model.ScheduleDesc;
import com.infini.ccahe.service.RsHiddenStopService;
import com.infini.ccahe.utils.StringUtils;

public class RsHiddenStopServiceImpl implements RsHiddenStopService {
    private RsHiddenStopRepository rsHiddenStopRepository;
    
    public RsHiddenStopServiceImpl() {
    }

    public RsHiddenStopServiceImpl(RsHiddenStopRepository rsStopoverRepository) {
        this.rsHiddenStopRepository = rsStopoverRepository;
    }

    @Override
    public int deleteRsHiddenStopByCacheId(String cacheId) {
        try {
            if (!StringUtils.isNullOrEmpty(cacheId)) {
                List<RsHiddenStop> rsHiddenStops = this.rsHiddenStopRepository.findAllByCacheId(cacheId);
                if (rsHiddenStops != null) {
                    this.rsHiddenStopRepository.deleteAll(rsHiddenStops);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    @Override
    public int insertRsHiddenStop(String cacheId, GroupedItineraryResponse responseObj) {
        try {
            List<ScheduleDesc> scheduleDescs = responseObj.getScheduleDescs();
            for (ScheduleDesc scheduleDesc : scheduleDescs) {
                List<HiddenStop> hiddenStops = scheduleDesc.getHiddenStops();
                int hiddenStopId = 1;
                for (HiddenStop hiddenStop : hiddenStops) {
                    DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(Constant.FORMAT_DATE_TIME);
                    String currentTime = dateTimeFormatter.format(LocalDateTime.now());
                    
                    RsHiddenStopPK rsHiddenStopPK = new RsHiddenStopPK();
                    rsHiddenStopPK.setCacheId(cacheId);
                    rsHiddenStopPK.setScheduleId(Short.valueOf(scheduleDesc.getId()));
                    rsHiddenStopPK.setHiddenStopId(Short.valueOf(String.valueOf(hiddenStopId)));
                    hiddenStopId++;
                    
                    RsHiddenStop rsHiddenStop = new RsHiddenStop();
                    rsHiddenStop.setId(rsHiddenStopPK);
                    rsHiddenStop.setHiddenStopAirport(hiddenStop.getAirport());
                    rsHiddenStop.setHiddenStopArrivalTime(hiddenStop.getArrivalTime());
                    if (hiddenStop.getArrivalDateAdjustment() != null) {
                        rsHiddenStop.setHiddenStopArrivalDateAdjustment(Short.valueOf(hiddenStop.getArrivalDateAdjustment()));
                    }
                    rsHiddenStop.setHiddenStopDepartureTime(hiddenStop.getDepartureTime());
                    if (hiddenStop.getDepartureDateAdjustment() != null) {
                        rsHiddenStop.setHiddenStopDepartureDateAdjustment(Short.valueOf(hiddenStop.getDepartureDateAdjustment()));
                    }
                    rsHiddenStop.setCreatedTime(currentTime);
                    rsHiddenStop.setLastUpdatedTime(currentTime);
                    
                    rsHiddenStopRepository.save(rsHiddenStop);
                }
            }

            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
