package com.infini.b2e.dao;

import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.infini.b2e.entity.UserInfini;

@Repository
@Transactional
public class UserInfiniDAO {

    private static final int MAX_ATTEMPT = 6;

    @Autowired
    private EntityManager entityManager;

    /**
     * @param user_id
     * @return
     */
    public UserInfini findUserAccounts(String user_id) {
        String sql = "SELECT e FROM UserInfini e WHERE e.user_id = :user_id";
        try {
            Query query = entityManager.createQuery(sql, UserInfini.class);
            query.setParameter("user_id", user_id);
            query.getSingleResult();
            return (UserInfini) query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * @param user_id
     */
    public void resetFailAttempts(String user_id) {
        UserInfini userInfini = findUserAccounts(user_id);
        userInfini.setAttemp(0);
        userInfini.setBlock_f(true);
        userInfini.setLast_modified(null);
        entityManager.merge(userInfini);
    }

    /**
     * @param user_id
     */
    public UserInfini updateUserFailAttempt(String user_id) {
        UserInfini userInfini = findUserAccounts(user_id);
        userInfini.setAttemp(userInfini.getAttemp() + 1);
        userInfini.setLast_modified(new Date());
        if (userInfini.getAttemp() >= MAX_ATTEMPT) {
            userInfini.setBlock_f(false);
        }
        entityManager.merge(userInfini);
        return userInfini;
    }
}
