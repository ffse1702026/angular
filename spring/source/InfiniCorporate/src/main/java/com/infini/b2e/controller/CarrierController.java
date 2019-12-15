package com.infini.b2e.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infini.b2e.entity.MstCarrier;
import com.infini.b2e.service.MstCarrierService;

@Controller
public class CarrierController {

    @Autowired
    private MstCarrierService mstCarrierService;
    
    @ResponseBody
    @RequestMapping("/carrier")
    public List<Map<String, String>> getDataMstCarrier(@RequestParam(name="parameter", required = false)  String parameter){
        List<Map<String, String>> listResponse = new ArrayList<Map<String, String>>();
        for(MstCarrier carrier :mstCarrierService.getAllMstCarrier(parameter)) {
            Map<String, String> response = new HashMap<String, String>();
            response.put("name", carrier.getCarrier_name_jp());
            listResponse.add(response);
        }
        return listResponse;
    }
}
