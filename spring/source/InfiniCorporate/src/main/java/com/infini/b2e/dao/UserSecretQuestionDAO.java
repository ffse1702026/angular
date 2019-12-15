package com.infini.b2e.dao;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infini.b2e.entity.UserSecretQuestion;

@Transactional
@Repository
public class UserSecretQuestionDAO {
    @Autowired
    private EntityManager entityManager;
    
    public UserSecretQuestion getUserSecretQuestion(String agent_id, String corporate_id ) {
        try {
            StringBuilder sql = new StringBuilder("from UserSecretQuestion where agent_id = : agent_id");
            if(corporate_id != null) {
                sql.append(" and corporate_id = :corporate_id");
            }
            TypedQuery<UserSecretQuestion> query = entityManager.createQuery(sql.toString(),UserSecretQuestion.class);
            query.setParameter("agent_id", agent_id);
            if(corporate_id != null) {
                query.setParameter("corporate_id", corporate_id);
            }
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
    
    public void saveUserSecretQuestion(UserSecretQuestion userSecretQuestion) {
        entityManager.persist(userSecretQuestion);
    }
}
