package com.infini.b2e.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infini.b2e.entity.UserAgent;

@Repository
@Transactional
public class UserAgentDAO {
    @Autowired
    private EntityManager entityManager;

    /**
     * @param userAgent
     */
    public void createUserAgent(UserAgent userAgent) {
        entityManager.persist(userAgent);
    }

    /**
     * @param userAgent
     */
    public void updateUserAgent(UserAgent userAgent) {
        entityManager.merge(userAgent);
    }

    /**
     * @param userAgent
     */
    public void deleteUserAgent(UserAgent userAgent) {
        entityManager.remove(userAgent);
    }

    /**
     * @param agentId
     * @return
     */
    public UserAgent getUserAgentByAgentId(String agentId) {
        try {
            return entityManager.find(UserAgent.class, agentId);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * @param email
     * @return
     */
    public UserAgent getUserAgentByAgentEmail(String email) {
        try {
            return entityManager.createQuery("from UserAgent where mail_address = '" + email + "'", UserAgent.class).getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * @param agent_id
     * @param pcc
     * @param agent_name
     * @param page
     * @param maxResult
     * @return
     */
    public List<UserAgent> getAllUserAgentByKeySearch(String agent_id, String pcc, String agent_name, int page, int maxResult) {
        try {
            StringBuilder sql = new StringBuilder("from UserAgent");
            if (agent_id != null || pcc != null || agent_name != null) {
                sql.append(" where ");
            }
            if (agent_id != null) {
                sql.append(" agent_id like :agent_id ");
            }
            if (pcc != null) {
                sql.append("and pcc like :pcc ");
            }
            if (pcc != null) {
                sql.append("and agent_name like :agent_name ");
            }
            sql.append(" order by created_date desc");
            TypedQuery<UserAgent> query = entityManager.createQuery(sql.toString(), UserAgent.class);
            if (agent_id != null) {
                query.setParameter("agent_id", "%" + agent_id + "%");
            }
            if (pcc != null) {
                query.setParameter("pcc", "%" + pcc + "%");
            }
            if (pcc != null) {
                query.setParameter("agent_name", "%" + agent_name + "%");
            }
            return query.setFirstResult((page - 1) * maxResult).setMaxResults(maxResult).getResultList();
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * @param agent_id
     * @param pcc
     * @param agent_name
     * @return
     */
    public long countSearchUserAgent(String agent_id, String pcc, String agent_name) {
        try {
            StringBuilder sql = new StringBuilder("from UserAgent");
            if (agent_id != null || pcc != null || agent_name != null) {
                sql.append(" where ");
            }
            if (agent_id != null) {
                sql.append(" agent_id like :agent_id ");
            }
            if (pcc != null) {
                sql.append("and pcc like :pcc ");
            }
            if (pcc != null) {
                sql.append("and agent_name like :agent_name ");
            }
            sql.append(" order by created_date");
            TypedQuery<UserAgent> query = entityManager.createQuery(sql.toString(), UserAgent.class);
            if (agent_id != null) {
                query.setParameter("agent_id", "%" + agent_id + "%");
            }
            if (pcc != null) {
                query.setParameter("pcc", "%" + pcc + "%");
            }
            if (pcc != null) {
                query.setParameter("agent_name", "%" + agent_name + "%");
            }
            return query.getResultList().size();
        } catch (Exception e) {
            return 0;
        }
    }

}
