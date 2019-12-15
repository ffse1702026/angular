package com.d2e.dao;

import java.util.List;

import com.d2e.entity.ChatMessage;

public interface ChatMessageDAO {
	public List<ChatMessage> getAll();
	public ChatMessage getById(int id);
	public void createChatMessage(ChatMessage chatMessage);
	public void updateChatMessage(ChatMessage chatMessage);
	public void deleteStudent(ChatMessage chatMessage);
}
