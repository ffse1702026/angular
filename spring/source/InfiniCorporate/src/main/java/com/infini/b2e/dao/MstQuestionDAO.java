package com.infini.b2e.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infini.b2e.entity.MstQuestion;

@Repository
@Transactional
public class MstQuestionDAO {
    @Autowired
    private EntityManager entityManager;

    public List<MstQuestion> getAllMstQuestion() {
        try {
            return entityManager.createQuery("from MstQuestion order by created_date desc", MstQuestion.class).getResultList();
        } catch (Exception e) {
            return null;
        }
    }
}
