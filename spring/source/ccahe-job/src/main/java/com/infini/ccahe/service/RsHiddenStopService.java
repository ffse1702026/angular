package com.infini.ccahe.service;

import com.infini.ccahe.responsetask.model.GroupedItineraryResponse;

public interface RsHiddenStopService {
	public int deleteRsHiddenStopByCacheId(String cacheId);
	
	public int insertRsHiddenStop(String cacheId, GroupedItineraryResponse responseObj);
}
