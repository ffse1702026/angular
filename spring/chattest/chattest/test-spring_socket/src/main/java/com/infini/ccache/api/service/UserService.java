package com.infini.ccache.api.service;

import java.net.UnknownHostException;

import org.springframework.stereotype.Service;

import com.infini.ccache.api.entity.UserInfo;

// TODO: Auto-generated Javadoc
/**
 * The Interface UserService.
 */
@Service
public interface UserService {

    /**
     * Check Exist User.
     *
     * @param id the id
     * @return the user info
     * @throws Exception the exception
     */
    UserInfo isExistUser(String id) throws Exception;
    
    void updateUserInfoByToken(UserInfo userInfo);

	UserInfo isExistUserByToken(String token) throws Exception;
}