package com.d2e.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

@Transactional
@Repository
public interface AppRoleDAO {
	  public List<String> getRoleNames(Long userId);
}
