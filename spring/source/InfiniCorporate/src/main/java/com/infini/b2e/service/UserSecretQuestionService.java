package com.infini.b2e.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infini.b2e.dao.UserSecretQuestionDAO;
import com.infini.b2e.entity.UserSecretQuestion;

@Service
public class UserSecretQuestionService {
    
    @Autowired
    private UserSecretQuestionDAO userSecretQuestionDAO;
    
    public UserSecretQuestion getUserSecretQuestion(String agent_id, String corporate_id ) {
        return userSecretQuestionDAO.getUserSecretQuestion(agent_id, corporate_id);
    }
    
    public void saveUserSecretQuestion(UserSecretQuestion userSecretQuestion) {
        userSecretQuestionDAO.saveUserSecretQuestion(userSecretQuestion);
    }
}
