package com.infini.b2e.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infini.b2e.dao.MstAirportDAO;
import com.infini.b2e.dao.MstCityDAO;
import com.infini.b2e.entity.MstAirport;
import com.infini.b2e.entity.MstCity;
import com.infini.b2e.service.MstAirportService;
import com.infini.b2e.service.MstCityService;

@Controller
public class MstAirportController {

    @Autowired
    private MstCityService mstCityService;

    @Autowired
    private MstAirportService mstAirportService;

    @RequestMapping("/airport")
    @ResponseBody
    public List<Map<String, String>> getDataMstAirport(@RequestParam(name = "parameter", required = false) String parameter,
            @RequestParam(name = "characterEngLish", required = false) boolean characterEngLish) {

        List<Map<String, String>> listResponse = new ArrayList<Map<String, String>>();
        if (characterEngLish) {
            for (MstCity mstCity : mstCityService.getAllMstCity(parameter)) {
                Map<String, String> response = new HashMap<String, String>();
                response.put("name", mstCity.getCity_name_jp());
                response.put("code", "[全ての空港]" + mstCity.getCity_code());
                response.put("classify", "city");
                response.put("include", "outside");
                listResponse.add(response);

                for (MstAirport mstAirport : mstCity.getListMstAirport()) {
                    Map<String, String> responseMstAirport = new HashMap<String, String>();
                    responseMstAirport.put("name", mstAirport.getAirport_name_jp());
                    responseMstAirport.put("code", mstAirport.getAirport_code());
                    responseMstAirport.put("classify", "airport");
                    responseMstAirport.put("include", "inside");
                    listResponse.add(responseMstAirport);
                }
            }
            for (MstAirport mstAirport : mstAirportService.getAllMstCityByDetailQuery(null, null, parameter, null)) {
                Map<String, String> responseMstAirport = new HashMap<String, String>();
                responseMstAirport.put("name", mstAirport.getAirport_name_jp());
                responseMstAirport.put("code", mstAirport.getAirport_code());
                responseMstAirport.put("classify", "airport");
                responseMstAirport.put("include", "outside");
                listResponse.add(responseMstAirport);
            }
            for (MstCity mstCity : mstCityService.getAllMstCityByCityName(parameter)) {
                Map<String, String> response = new HashMap<String, String>();
                response.put("name", mstCity.getCity_name_jp());
                response.put("code", "[全ての空港]" + mstCity.getCity_code());
                response.put("classify", "city");
                response.put("include", "outside");
                listResponse.add(response);
                for (MstAirport mstAirport : mstCity.getListMstAirport()) {
                    Map<String, String> responseMstAirport = new HashMap<String, String>();
                    responseMstAirport.put("name", mstAirport.getAirport_name_jp());
                    responseMstAirport.put("code", mstAirport.getAirport_code());
                    responseMstAirport.put("classify", "airport");
                    responseMstAirport.put("include", "inside");
                    listResponse.add(responseMstAirport);
                }
            }
            for (MstAirport mstAirport : mstAirportService.getAllMstCityByDetailQuery(null, null, null, parameter)) {
                Map<String, String> responseMstAirport = new HashMap<String, String>();
                responseMstAirport.put("name", mstAirport.getAirport_name_jp());
                responseMstAirport.put("code", mstAirport.getAirport_code());
                responseMstAirport.put("classify", "airport");
                responseMstAirport.put("include", "outside");
                listResponse.add(responseMstAirport);
            }
        } else {
            for (MstCity mstCity : mstCityService.getAllMstCityByCityNameJP(parameter)) {
                Map<String, String> response = new HashMap<String, String>();
                response.put("name", mstCity.getCity_name_jp());
                response.put("code", "[全ての空港]" + mstCity.getCity_code());
                response.put("classify", "city");
                response.put("include", "outside");
                listResponse.add(response);

                for (MstAirport mstAirport : mstCity.getListMstAirport()) {
                    Map<String, String> responseMstAirport = new HashMap<String, String>();
                    responseMstAirport.put("name", mstAirport.getAirport_name_jp());
                    responseMstAirport.put("code", mstAirport.getAirport_code());
                    responseMstAirport.put("classify", "airport");
                    responseMstAirport.put("include", "inside");
                    listResponse.add(responseMstAirport);
                }
            }
            for (MstAirport mstAirport : mstAirportService.getAllMstCityByAiportNameJP(parameter)) {
                Map<String, String> responseMstAirport = new HashMap<String, String>();
                responseMstAirport.put("name", mstAirport.getAirport_name_jp());
                responseMstAirport.put("code", mstAirport.getAirport_code());
                responseMstAirport.put("classify", "airport");
                responseMstAirport.put("include", "inside");
                listResponse.add(responseMstAirport);
            }
        }
        return listResponse;
    }

    @RequestMapping("/airportjp")
    @ResponseBody
    public List<Map<String, String>> getDataMstAirportByJPName(@RequestParam(name = "parameter", required = false) String parameter) {
        /*
         * List<MstAirport> listMstAirPortByAirportCode = new ArrayList<MstAirport>();
         * List<MstAirport> listMstAirPortByAirportName = new ArrayList<MstAirport>();
         * List<MstCity> listMstCityByCityCode = new ArrayList<MstCity>(); List<MstCity>
         * listMstCityByCityName = new ArrayList<MstCity>();
         */
        List<Map<String, String>> listResponse = new ArrayList<Map<String, String>>();

        for (MstCity mstCity : mstCityService.getAllMstCityByCityNameJP(parameter)) {
            Map<String, String> response = new HashMap<String, String>();
            response.put("name", mstCity.getCity_name_jp());
            response.put("code", "[全ての空港]" + mstCity.getCity_code());
            listResponse.add(response);
            for (MstAirport mstAirport : mstCity.getListMstAirport()) {
                Map<String, String> responseMstAirport = new HashMap<String, String>();
                responseMstAirport.put("name", mstAirport.getAirport_name_jp());
                responseMstAirport.put("code", mstAirport.getAirport_code());
                listResponse.add(responseMstAirport);
            }
        }

        for (MstAirport mstAirport : mstAirportService.getAllMstCityByDetailQuery(parameter, null, null, parameter)) {
            Map<String, String> responseMstAirport = new HashMap<String, String>();
            responseMstAirport.put("name", mstAirport.getAirport_name_jp());
            responseMstAirport.put("code", mstAirport.getAirport_code());
            listResponse.add(responseMstAirport);
        }

        return listResponse;
    }
}
