package com.infini.ccahe.service;

import com.infini.ccahe.responsetask.model.GroupedItineraryResponse;

public interface RsFarebasiService {
	public int deleteRsFarebasiByCacheId(String cacheId);
	
	public int insertRsFarebasi(String cacheId, GroupedItineraryResponse responseObj);
}
