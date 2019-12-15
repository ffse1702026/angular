package com.infini.ccahe.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import com.infini.ccahe.common.Constant;
import com.infini.ccahe.entity.RsTax;
import com.infini.ccahe.entity.RsTaxPK;
import com.infini.ccahe.repository.RsTaxRepository;
import com.infini.ccahe.responsetask.model.GroupedItineraryResponse;
import com.infini.ccahe.responsetask.model.TaxDesc;
import com.infini.ccahe.service.RsTaxService;
import com.infini.ccahe.utils.StringUtils;

public class RsTaxServiceImpl implements RsTaxService {
	private RsTaxRepository rsTaxRepository;
	
	public RsTaxServiceImpl() {
	}

	public RsTaxServiceImpl(RsTaxRepository rsTaxRepository) {
		this.rsTaxRepository = rsTaxRepository;
	}

	@Override
	public int deleteRsTaxByCacheId(String cacheId) {
		try {
			if (!StringUtils.isNullOrEmpty(cacheId)) {
				List<RsTax> rsTaxs = this.rsTaxRepository.findAllByCacheId(cacheId);
				if (rsTaxs != null) {
					this.rsTaxRepository.deleteAll(rsTaxs);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}

	@Override
	public int insertRsTax(String cacheId, GroupedItineraryResponse responseObj) {
		try {
			List<TaxDesc> taxDescs = responseObj.getTaxDescs();
			for (TaxDesc taxDesc : taxDescs) {
				DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(Constant.FORMAT_DATE_TIME);
				String currentTime = dateTimeFormatter.format(LocalDateTime.now());
				
				RsTaxPK rsTaxPK = new RsTaxPK();
				rsTaxPK.setCacheId(cacheId);
				rsTaxPK.setTaxId(Short.valueOf(taxDesc.getId()));
				rsTaxPK.setCode(taxDesc.getCode());
				
				RsTax rsTax = new RsTax();
				rsTax.setId(rsTaxPK);
				rsTax.setAmount(taxDesc.getAmount());
				rsTax.setCreatedTime(currentTime);
				rsTax.setLastUpdatedTime(currentTime);
				
				rsTaxRepository.save(rsTax);
			}
			
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}
}
