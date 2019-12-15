package com.d2e.dao.impl;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.d2e.dao.GroupDAO;
import com.d2e.entity.Group;

@Repository
@Transactional
public class GroupDAOImpl implements GroupDAO {

	@Autowired
	private EntityManager entityManager;

	@Override
	public void insertGroup(Group group) {
		this.entityManager.persist(group);
	}

}
