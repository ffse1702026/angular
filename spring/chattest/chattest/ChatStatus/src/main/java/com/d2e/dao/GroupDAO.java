package com.d2e.dao;

import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.d2e.entity.Group;

@Repository

public interface GroupDAO {
	public void insertGroup(Group group);
}
