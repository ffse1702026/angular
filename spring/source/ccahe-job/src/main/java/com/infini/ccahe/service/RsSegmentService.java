package com.infini.ccahe.service;

import com.infini.ccahe.responsetask.model.GroupedItineraryResponse;

public interface RsSegmentService {
	public int deleteRsSegmentByCacheId(String cacheId);
	
	public int insertRsSegment(String cacheId, GroupedItineraryResponse responseObj);
}
