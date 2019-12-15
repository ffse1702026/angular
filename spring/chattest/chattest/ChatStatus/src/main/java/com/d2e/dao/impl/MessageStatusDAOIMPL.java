package com.d2e.dao.impl;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;

import com.d2e.dao.MessageStatusDAO;
import com.d2e.entity.MessageStatus;

public class MessageStatusDAOIMPL implements  MessageStatusDAO{


	@Autowired
	private EntityManager entityManager;
	@Override
	public void MessageStatusDAO(MessageStatus messageStatus) {
		// TODO Auto-generated method stub
		entityManager.persist(messageStatus);
	}

}
