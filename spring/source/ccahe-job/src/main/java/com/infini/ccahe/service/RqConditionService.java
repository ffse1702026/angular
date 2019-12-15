package com.infini.ccahe.service;

import com.infini.ccahe.dto.BargainFinderMaxRQDto;
import com.infini.ccahe.entity.RqCondition;

public interface RqConditionService {
	public RqCondition getRqConditionByRequestId(String requestId);
	
	public int deleteRqCondition(RqCondition rqCondition);

	public int insertRqCondition(String cacheId, String requestId, BargainFinderMaxRQDto requestDto);
}
