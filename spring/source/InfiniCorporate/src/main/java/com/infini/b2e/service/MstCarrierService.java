package com.infini.b2e.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infini.b2e.dao.MstCarrierDAO;
import com.infini.b2e.entity.MstCarrier;

@Service
public class MstCarrierService {

    @Autowired
    private MstCarrierDAO mstCarrierDAO;
    
    public MstCarrier getMstCarrierByCarrierCode(String carrier_code) {
        return mstCarrierDAO.getMstCarrierByCarrierCode(carrier_code);
    }
    
    public List<MstCarrier> getAllMstCarrier(String carrier_code) {
        return mstCarrierDAO.getAllMstCarrier(carrier_code);
    }
    
    

}
