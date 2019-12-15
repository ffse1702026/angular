package com.infini.b2e.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infini.b2e.dao.UserAgentDAO;
import com.infini.b2e.entity.UserAgent;

@Service
public class UserAgentService {

    @Autowired
    private UserAgentDAO userAgenDAO;

    public void createUserAgent(UserAgent userAgent) {
        userAgenDAO.createUserAgent(userAgent);
    }

    public void updateUserAgent(UserAgent userAgent) {
        userAgenDAO.updateUserAgent(userAgent);
    }

    public void deleteUserAgent(UserAgent userAgent) {
        userAgenDAO.deleteUserAgent(userAgent);
    }

    public UserAgent getUserAgentByAgentId(String agentId) {
        return userAgenDAO.getUserAgentByAgentId(agentId);
    }

    public UserAgent getUserAgentByAgentEmail(String email) {
        return userAgenDAO.getUserAgentByAgentEmail(email);
    }

    public List<UserAgent> getAllUserAgentByKeySearch(String agent_id, String pcc, String agent_name, int page, int maxResult) {
        return userAgenDAO.getAllUserAgentByKeySearch(agent_id, pcc, agent_name, page, maxResult);
    }

    public long countSearchUserAgent(String agent_id, String pcc, String agent_name) {
        return userAgenDAO.countSearchUserAgent(agent_id, pcc, agent_name);
    }
}
