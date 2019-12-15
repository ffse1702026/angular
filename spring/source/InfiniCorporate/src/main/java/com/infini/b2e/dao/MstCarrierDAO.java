package com.infini.b2e.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infini.b2e.entity.MstCarrier;

@Repository
@Transactional
public class MstCarrierDAO {

    @Autowired
    private EntityManager entityManager;

    /**
     * @param carrier_code
     * @return
     */
    public MstCarrier getMstCarrierByCarrierCode(String carrier_code) {
        try {
            StringBuilder sql = new StringBuilder("from MstCarrier");
            sql.append(" where carrier_code = :carrier_code order by created_date");
            TypedQuery<MstCarrier> query = entityManager.createQuery(sql.toString(), MstCarrier.class);
            query.setParameter("carrier_code", carrier_code);
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
    
    public List<MstCarrier> getAllMstCarrier(String carrier_code) {
        StringBuilder sql = new StringBuilder("from MstCarrier");
        sql.append(" where carrier_code = :carrier_code order by created_date");
        TypedQuery<MstCarrier> query = entityManager.createQuery(sql.toString(), MstCarrier.class);
        query.setParameter("carrier_code", carrier_code);
        return query.getResultList();
    }
}
