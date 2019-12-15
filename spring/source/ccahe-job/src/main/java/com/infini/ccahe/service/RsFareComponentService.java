package com.infini.ccahe.service;

import com.infini.ccahe.responsetask.model.GroupedItineraryResponse;

public interface RsFareComponentService {
	public int deleteRsFareComponentByCacheId(String cacheId);
	
	public int insertRsFareComponent(String cacheId, GroupedItineraryResponse responseObj);
}
