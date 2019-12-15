package com.infini.ccache.api.service;

import org.springframework.stereotype.Service;

import com.infini.ccache.api.entity.UserInfo;

// TODO: Auto-generated Javadoc
/**
 * The Interface LogAccessService.
 */
@Service
public interface LogAccessService {

    /**
     * Sets the access log.
     *
     * @param userInfo the user info
     * @param result the result
     * @throws Exception the exception
     */
    void setAccessLog(UserInfo userInfo, String result) throws Exception;
}
