package com.infini.b2e.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infini.b2e.controller.MstHolidayController;
import com.infini.b2e.entity.MstHoliday;

@Repository
@Transactional
public class MstHolidayDAO {
    
    @Autowired
    private EntityManager entityManager;
    
    public List<MstHoliday> getAllMstHoliday(){
        return entityManager.createQuery("from MstHoliday order by created_date", MstHoliday.class).getResultList();
    }
}
