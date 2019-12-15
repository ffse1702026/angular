package com.d2e.dao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.d2e.entity.AppUser;
 
@Repository
@Transactional
public interface AppUserDAO {
 
    public AppUser findUserAccount(String userName);
 
}