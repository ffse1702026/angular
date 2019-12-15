package com.d2e.dao;

import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.d2e.entity.MessageStatus;

@Repository
@Transactional
public interface MessageStatusDAO {
	public void MessageStatusDAO(MessageStatus messageStatus);
}