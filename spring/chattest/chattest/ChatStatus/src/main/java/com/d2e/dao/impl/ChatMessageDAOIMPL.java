package com.d2e.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.d2e.dao.ChatMessageDAO;
import com.d2e.entity.ChatMessage;

@Repository
@Transactional
public class ChatMessageDAOIMPL implements ChatMessageDAO{

	@Autowired
	private EntityManager entityManager;
	
	@Override
	public List<ChatMessage> getAll() {
		return entityManager.createQuery("from ChatMessage",ChatMessage.class).getResultList();
	}

	@Override
	public ChatMessage getById(int id) {
		return entityManager.find(ChatMessage.class,id);
	}

	@Override
	public void createChatMessage(ChatMessage chatMessage) {
		entityManager.persist(chatMessage);	
	}

	@Override
	public void updateChatMessage(ChatMessage chatMessage) {
		
	}

	@Override
	public void deleteStudent(ChatMessage chatMessage) {
		// TODO Auto-generated method stub
		
	}
		

}
