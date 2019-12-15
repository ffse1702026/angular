package com.infini.ccache.api.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Component;

import com.infini.ccache.api.entity.UserInfo;
import com.infini.ccache.api.service.LogAccessService;

// TODO: Auto-generated Javadoc
/**
 * The Class LogAccessServiceImpl.
 */
@Component
public class LogAccessServiceImpl implements LogAccessService{

    /** The jdbc template. */
    @Autowired
    private NamedParameterJdbcTemplate jdbcTemplate;

    /* (non-Javadoc)
     * @see com.infini.ccache.api.service.LogAccessService#setAccessLog(com.infini.ccache.api.entity.UserInfo, java.lang.String)
     */
    @Override
    public void setAccessLog(UserInfo userInfo, String result) throws Exception{
        String sql = "INSERT INTO log_access(access_time, user, pcc, ip, access_result) VALUES(CURRENT_TIMESTAMP(), :id, :pcc, :ip, :access)";
        SqlParameterSource namedParameters = null;
        namedParameters = new MapSqlParameterSource().addValue("id", userInfo.getId()).addValue("pcc", userInfo.getPcc()).addValue("ip", userInfo.getIp()).addValue("access", result);
        jdbcTemplate.update(sql, namedParameters);
    }
}
