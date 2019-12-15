package com.infini.b2e.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infini.b2e.controller.MstHolidayController;
import com.infini.b2e.dao.MstHolidayDAO;
import com.infini.b2e.entity.MstHoliday;

@Service
public class MstHolidayService {

    @Autowired
    private MstHolidayDAO mstHolidayDAO;
    
    public List<MstHoliday> getAllMstHoliday(){
        return mstHolidayDAO.getAllMstHoliday();
    }
}
