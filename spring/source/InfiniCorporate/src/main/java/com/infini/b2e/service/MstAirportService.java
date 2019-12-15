package com.infini.b2e.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infini.b2e.dao.MstAirportDAO;
import com.infini.b2e.entity.MstAirport;
import com.infini.b2e.entity.MstCity;

@Service
public class MstAirportService {

    @Autowired
    private MstAirportDAO mstAirportDao;
    
    public MstAirport getMstAirportByAirportCode(String airport_code){
        return mstAirportDao.getMstAirportByAirportCode(airport_code);
    }
    public List<MstAirport> getAllMstCityByDetailQuery(String city_code, String city_name,String airport_code, String airport_name){
        return mstAirportDao.getAllMstCityByDetailQuery(city_code, city_name, airport_code, airport_name);
    }
    
    public List<MstAirport> getAllMstCityByAiportNameJP(String airport_name_jp){
        return mstAirportDao.getAllMstCityByAiportNameJP(airport_name_jp);
    }
    
    
}
