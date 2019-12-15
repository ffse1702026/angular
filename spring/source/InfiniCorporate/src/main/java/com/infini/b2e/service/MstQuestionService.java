package com.infini.b2e.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infini.b2e.dao.MstQuestionDAO;
import com.infini.b2e.entity.MstQuestion;

@Service
public class MstQuestionService {

    @Autowired
    private MstQuestionDAO mstQuestionDAO;

    public List<MstQuestion> getAllMstQuestion() {
        try {
            return mstQuestionDAO.getAllMstQuestion();
        } catch (Exception e) {
            return null;
        }

    }
}
