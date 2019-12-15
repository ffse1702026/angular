package com.infini.b2e.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;

import com.infini.b2e.entity.UserCorporate;

public class UserCorporateDAO {
    @Autowired
    private EntityManager entityManager;

    /**
     * @param page
     * @return
     */
    public List<UserCorporate> getAllUserAgent(int page) {
        try {
        return entityManager.createQuery("from UserCorporate order by created_date", UserCorporate.class).setFirstResult((page - 1) * 20)
                .setMaxResults(20).getResultList();
        }catch (Exception e) {
            return null;
        }
    }

}
