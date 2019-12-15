package com.infini.ccahe.service;

import com.infini.ccahe.responsetask.model.GroupedItineraryResponse;

public interface RsSegComponentService {
	public int deleteRsSegComponentByCacheId(String cacheId);
	
	public int insertRsSegComponent(String cacheId, GroupedItineraryResponse responseObj);
}
