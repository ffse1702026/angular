package com.infini.ccahe.service;

import com.infini.ccahe.responsetask.model.GroupedItineraryResponse;

public interface RsTaxComponentService {
	public int deleteRsTaxComponentByCacheId(String cacheId);
	
	public int insertRsTaxComponent(String cacheId, GroupedItineraryResponse responseObj);
}
