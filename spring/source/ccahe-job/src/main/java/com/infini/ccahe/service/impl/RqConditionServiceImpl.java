package com.infini.ccahe.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.stereotype.Service;

import com.infini.ccahe.dto.BargainFinderMaxRQDto;
import com.infini.ccahe.entity.RqCondition;
import com.infini.ccahe.entity.RqConditionPK;
import com.infini.ccahe.repository.RqConditionRepository;
import com.infini.ccahe.service.RqConditionService;

@Service
public class RqConditionServiceImpl implements RqConditionService {
	private RqConditionRepository rqConditionRepository;

	public RqConditionServiceImpl() {
	}

	public RqConditionServiceImpl(RqConditionRepository rqConditionRepository) {
		this.rqConditionRepository = rqConditionRepository;
	}

	@Override
	public RqCondition getRqConditionByRequestId(String requestId) {
		try {
			List<RqCondition> rqConditions = this.rqConditionRepository.findByRequestId(requestId);
			if (rqConditions != null && rqConditions.size() > 0) {
				return rqConditions.get(0);
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int deleteRqCondition(RqCondition rqCondition) {
		try {
			if (rqCondition != null) {
				this.rqConditionRepository.delete(rqCondition);
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

	}

	@Override
	public int insertRqCondition(String cacheId, String requestId, BargainFinderMaxRQDto requestDto) {
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
		String currentTime = dateTimeFormatter.format(LocalDateTime.now());
		RqCondition rqCondition = new RqCondition();
		RqConditionPK rqConditionPK = new RqConditionPK();

		try {
			rqConditionPK.setCacheId(cacheId);
			rqConditionPK.setRequestId(requestId);
			rqCondition.setId(rqConditionPK);
			rqCondition.setOutboundDateFrom(requestDto.getOutboundDateFrom());
			rqCondition.setOutboundDateTo(requestDto.getOutboundDateTo());
			rqCondition.setOutboundTimeFrom(_formatTime(requestDto.getOutboundTimeFrom()));
			rqCondition.setOutboundTimeTo(_formatTime(requestDto.getOutboundTimeTo()));
			rqCondition.setDepartureAirport(requestDto.getDepartureAirport());
			rqCondition.setArrivalAirport(requestDto.getArrivalAirport());
			rqCondition.setStaydays(Short.valueOf(requestDto.getStayDay()));
			rqCondition.setInboundTimeFrom(_formatTime(requestDto.getInboundTimeFrom()));
			rqCondition.setInboundTimeTo(_formatTime(requestDto.getInboundTimeTo()));
			rqCondition.setCarrier(requestDto.getCarrier());
			rqCondition.setStops(Short.valueOf(requestDto.getStops()));
			rqCondition.setCabin(requestDto.getCabin());
			rqCondition.setExcludeCodeshare(requestDto.getExcludeCodeshare());
			rqCondition.setFreePiece(requestDto.getFreePiece());
			rqCondition.setNumOfAdt(Short.valueOf(requestDto.getNumOfAdt()));
			rqCondition.setNumOfCnn(Short.valueOf(requestDto.getNumOfCnn()));
			rqCondition.setNumOfIns(Short.valueOf(requestDto.getNumOfIns()));
			rqCondition.setNumOfInf(Short.valueOf(requestDto.getNumOfInf()));
			rqCondition.setCreatedTime(currentTime);
			rqCondition.setLastUpdatedTime(currentTime);

			this.rqConditionRepository.save(rqCondition);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	private String _formatTime(String time) {
		if (time.length() == 4) {
			return time.substring(0, 2) + ":" + time.substring(2, 4);
		}

		return time;
	}
}
