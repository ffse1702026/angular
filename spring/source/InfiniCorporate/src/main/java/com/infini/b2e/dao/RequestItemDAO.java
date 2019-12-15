package com.infini.b2e.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infini.b2e.entity.RequestItem;

@Repository
@Transactional
public class RequestItemDAO {
    @Autowired
    private EntityManager entityManager;

    /**
     * @param page
     * @param date_from
     * @param date_to
     * @param searchKey
     * @param maxResult
     * @return
     */
    public List<RequestItem> getAllRequestItem(int page, String date_from, String date_to, String searchKey, int maxResult) {
        try {
            StringBuilder sql = new StringBuilder("from RequestItem");
            if (date_from != null || searchKey != null) {
                sql.append(" where ");
                if (date_from != null) {
                    sql.append(" created_date BETWEEN '").append(date_from).append("' AND '").append(date_to).append("' AND (");
                }
                if (searchKey != null) {
                    sql.append("agent_id.agent_name like '%").append(searchKey).append("%'");
                    sql.append(" OR ").append("agent_id.pcc like '%").append(searchKey).append("%'");
                    sql.append(" OR ").append("request_id like '%").append(searchKey).append("%'");
                    sql.append(" OR ").append("corporate_id.corporate_name like '%").append(searchKey).append("%'");
                    sql.append(" OR ").append("to like '%").append(searchKey).append("%') order by created_date desc");
                }
            }
            return entityManager.createQuery(sql.toString(), RequestItem.class).setFirstResult((page - 1) * maxResult).setMaxResults(maxResult).getResultList();
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * @param page
     * @param date_from
     * @param date_to
     * @param searchKey
     * @return
     */
    public long countAllRequestItem(int page, String date_from, String date_to, String searchKey) {
        try {
            StringBuilder sql = new StringBuilder("from RequestItem");
            if (date_from != null || searchKey != null) {
                sql.append(" where ");
                if (date_from != null) {
                    sql.append(" created_date BETWEEN '").append(date_from).append("' AND '").append(date_to).append("' AND (");
                }
                if (searchKey != null) {
                    sql.append("agent_id.agent_name like '%").append(searchKey).append("%'");
                    sql.append(" OR ").append("agent_id.pcc like '%").append(searchKey).append("%'");
                    sql.append(" OR ").append("request_id like '%").append(searchKey).append("%'");
                    sql.append(" OR ").append("corporate_id.corporate_name like '%").append(searchKey).append("%'");
                    sql.append(" OR ").append("to like '%").append(searchKey).append("%')");
                }
            }
            return entityManager.createQuery(sql.toString(), RequestItem.class).getResultList().size();
        } catch (Exception e) {
            return 0;
        }
    }

    /**
     * @param request_id
     * @return
     */
    public RequestItem getRequestItemByRequestId(String request_id) {
        try {
            return entityManager.find(RequestItem.class, request_id);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * @param page
     * @param date_from
     * @param date_to
     * @param searchKey
     * @param maxResult
     * @return
     */
    public List<RequestItem> getAllByDto(int page, String date_from, String date_to, String searchKey, int maxResult) {
        try {
            StringBuilder sql = new StringBuilder("select ");
            return entityManager.createQuery(sql.toString(), RequestItem.class).setFirstResult((page - 1) * maxResult).setMaxResults(maxResult).getResultList();
        } catch (Exception e) {
            return null;
        }
    }
}
