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

import com.infini.b2e.dao.MstHolidayDAO;
import com.infini.b2e.entity.MstCarrier;
import com.infini.b2e.entity.MstHoliday;
import com.infini.b2e.service.MstHolidayService;

@Controller
public class MstHolidayController {
    @Autowired
    private MstHolidayService mstHolidayService;

    @ResponseBody
    @RequestMapping("/holiday")
    public List<Map<String, String>> getDataMstCarrier(){
        List<Map<String, String>> listResponse = new ArrayList<Map<String, String>>();
        for(MstHoliday holiday : mstHolidayService.getAllMstHoliday()) {
            Map<String, String> response = new HashMap<String, String>();
            response.put("date", holiday.getHoliday_date().substring(0,4) + "/" + holiday.getHoliday_date().substring(4,6) + "/" + holiday.getHoliday_date().substring(6,8));
            listResponse.add(response);
        }
        return listResponse;
    }

}
