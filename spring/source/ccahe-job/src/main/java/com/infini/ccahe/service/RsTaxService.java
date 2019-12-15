package com.infini.ccahe.service;

import com.infini.ccahe.responsetask.model.GroupedItineraryResponse;

public interface RsTaxService {
	public int deleteRsTaxByCacheId(String cacheId);
	
	public int insertRsTax(String cacheId, GroupedItineraryResponse responseObj);
}
