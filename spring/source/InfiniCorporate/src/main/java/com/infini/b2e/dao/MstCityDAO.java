package com.infini.b2e.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infini.b2e.entity.MstCity;

@Repository
@Transactional
public class MstCityDAO {

    @Autowired
    private EntityManager entityManager;

    /**
     * Get city list by city code
     * @param city_code
     * @return
     */
    public List<MstCity> getAllMstCity(String city_code) {
        StringBuilder sql = new StringBuilder("");
        sql.append("from MstCity ");
        if (city_code != null) {
            sql.append("where city_code = :city_code");
        }
        TypedQuery<MstCity> query = entityManager.createQuery(sql.toString(), MstCity.class);
        if (city_code != null) {
            query.setParameter("city_code", city_code);
        }
        return query.getResultList();
    }

    /**
     * Get city list by city name EN
     * @param paramQuery
     * @return
     */
    public List<MstCity> getAllMstCityByCityName(String paramQuery) {
        TypedQuery<MstCity> query = entityManager.createQuery(
                "SELECT DISTINCT c FROM MstCity c INNER JOIN c.listMstAirport a WHERE c.city_code = a.city_code and c.city_name_en like :city_name_en AND c.city_code != :city_code AND a.airport_code != :airport_code",
                MstCity.class);
        query.setParameter("city_name_en", "%" +paramQuery + "%");
        query.setParameter("city_code",  paramQuery );
        query.setParameter("airport_code", paramQuery);
        return query.getResultList();
    }
    
    /**
     * get city list by city name JP
     * @param paramQuery
     * @return
     */
    public List<MstCity> getAllMstCityByCityNameJP(String paramQuery) {
        TypedQuery<MstCity> query = entityManager.createQuery(
                "SELECT DISTINCT c FROM MstCity c INNER JOIN c.listMstAirport a WHERE c.city_code = a.city_code and c.city_name_jp like :city_name_jp",
                MstCity.class);
        query.setParameter("city_name_jp", "%" +paramQuery + "%");
        return query.getResultList();
    }
}
