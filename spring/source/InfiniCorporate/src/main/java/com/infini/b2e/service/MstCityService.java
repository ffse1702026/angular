package com.infini.b2e.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infini.b2e.dao.MstCityDAO;
import com.infini.b2e.entity.MstCity;

@Service
public class MstCityService {

    @Autowired
    private MstCityDAO mstCityDAO;

    public List<MstCity> getAllMstCity(String city_code) {
        return mstCityDAO.getAllMstCity(city_code);
    }
    
    public List<MstCity> getAllMstCityByCityName(String paramQuery){
        return mstCityDAO.getAllMstCityByCityName(paramQuery);
    }
    
    public List<MstCity> getAllMstCityByCityNameJP(String paramQuery){
        return mstCityDAO.getAllMstCityByCityNameJP(paramQuery);
    }

}
