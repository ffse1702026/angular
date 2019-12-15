package com.infini.b2e.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infini.b2e.entity.MstAirport;
import com.infini.b2e.entity.MstCity;

@Repository
@Transactional
public class MstAirportDAO {
    @Autowired
    private EntityManager entityManager;

    /**
     * @param airport_code
     * @return
     */
    public MstAirport getMstAirportByAirportCode(String airport_code) {
        try {
            StringBuilder sql = new StringBuilder("from MstAirport");
            sql.append(" where airport_code = :airport_code order by created_date");
            TypedQuery<MstAirport> query = entityManager.createQuery(sql.toString(), MstAirport.class);
            query.setParameter("airport_code", airport_code);
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    public List<MstAirport> getAllMstCityByDetailQuery(String city_code, String city_name, String airport_code, String airport_name) {
        StringBuilder sql = new StringBuilder("");
        sql.append("from MstAirport");
        if (airport_code != null) {
            sql.append(" where airport_code = :airport_code and city_code.city_code <> :city_code");
        }
        if (airport_name != null) {
            sql.append(
                    " where airport_name_en like :airport_name_en and airport_code <> :airport_code and city_code.city_code <> :city_code and city_code.city_name_en not like :city_name_en");
        }
        TypedQuery<MstAirport> query = entityManager.createQuery(sql.toString(), MstAirport.class);
        if (airport_code != null) {
            query.setParameter("city_code", airport_code);
            query.setParameter("airport_code", airport_code);
        }
        if (airport_name != null) {
            query.setParameter("airport_name_en", "%" + airport_name + "%");
            query.setParameter("city_name_en", "%" + airport_name + "%");
            query.setParameter("airport_code", airport_name);
            query.setParameter("city_code", airport_name);
        }
        return query.getResultList();
    }

    public List<MstAirport> getAllMstCityByAiportNameJP(String airport_name_jp){
        StringBuilder sql = new StringBuilder("");
        sql.append("from MstAirport");
        if (airport_name_jp != null) {
            sql.append(" where airport_name_jp like :airport_name_jp and city_code.city_name_jp not like :city_name_jp");
        }
        TypedQuery<MstAirport> query = entityManager.createQuery(sql.toString(), MstAirport.class);
        if (airport_name_jp != null) {
            query.setParameter("airport_name_jp", "%" + airport_name_jp + "%");
            query.setParameter("city_name_jp", "%" + airport_name_jp + "%");
        }
        return query.getResultList();
    }
}
