package com.infini.ccache.api.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Component;

import com.infini.ccache.api.entity.UserInfo;
import com.infini.ccache.api.service.UserService;

// TODO: Auto-generated Javadoc
/**
 * The Class UserServiceIpml.
 */
@Component
public class UserServiceIpml implements UserService {

	/** The jdbc template. */
	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;

	/**
	 * Check Exist User.
	 *
	 * @param id the id
	 * @return the user info
	 * @throws Exception the exception
	 */
	@Override
	public UserInfo isExistUser(String id) throws Exception {
		String sql = "";
		SqlParameterSource namedParameters = null;
		Map<String, Object> row = null;
		UserInfo userInfo = new UserInfo();

		sql = " SELECT id, pcc, ip, password, enable_password, token, time_create_token FROM mgmt_user where BINARY id = :id ";
		namedParameters = new MapSqlParameterSource().addValue("id", id);

		try {
			row = jdbcTemplate.queryForMap(sql, namedParameters);
			if (!row.isEmpty()) {
				userInfo.setId(row.get("id").toString());
				userInfo.setPcc(row.get("pcc").toString());
				if (row.get("token") != null) {
					userInfo.setToken(row.get("token").toString());
				}
				if (row.get("time_create_token") != null) {
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					userInfo.setTimeCreateToken(
							formatter.parse(row.get("time_create_token").toString().substring(0, 19)));

				}
				if (row.get("enable_password") != null) {
					String enablePW = row.get("enable_password").toString();
					if ("true".equals(row.get("enable_password").toString())) {
						enablePW = "1";
					} else if ("false".equals(row.get("enable_password").toString())) {
						enablePW = "0";
					}
					userInfo.setEnablePassword(Integer.parseInt(enablePW));
				}
				if (row.get("password") != null) {
					userInfo.setPassword(row.get("password").toString());
				} else {
					userInfo.setPassword("");
				}
				if (row.get("ip") != null) {
					userInfo.setIp(row.get("ip").toString());
				} else {
					userInfo.setIp("");
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			if (ex instanceof EmptyResultDataAccessException) {
				return null;
			}
			throw ex;
		}
		return userInfo;
	}

	@Override
	public void updateUserInfoByToken(UserInfo userInfo) {
		String sql = " update mgmt_user SET token = :token, time_create_token = :timeCreateToken  where BINARY id = :id ";
		SqlParameterSource namedParameters = new MapSqlParameterSource().addValue("id", userInfo.getId())
				.addValue("token", userInfo.getToken()).addValue("timeCreateToken", userInfo.getTimeCreateToken());
		jdbcTemplate.update(sql, namedParameters);

	}

	@Override
	public UserInfo isExistUserByToken(String token) throws Exception{
		String sql = "";
		SqlParameterSource namedParameters = null;
		Map<String, Object> row = null;
		UserInfo userInfo = new UserInfo();

		sql = " SELECT id, pcc, ip, password, enable_password, token, time_create_token FROM mgmt_user where BINARY token = :token ";
		namedParameters = new MapSqlParameterSource().addValue("token", token);

		try {
			row = jdbcTemplate.queryForMap(sql, namedParameters);
			if (!row.isEmpty()) {
				userInfo.setId(row.get("id").toString());
				userInfo.setPcc(row.get("pcc").toString());
				if (row.get("token") != null) {
					userInfo.setToken(row.get("token").toString());
				}
				if (row.get("time_create_token") != null) {
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					userInfo.setTimeCreateToken(
							formatter.parse(row.get("time_create_token").toString().substring(0, 19)));

				}
				if (row.get("enable_password") != null) {
					String enablePW = row.get("enable_password").toString();
					if ("true".equals(row.get("enable_password").toString())) {
						enablePW = "1";
					} else if ("false".equals(row.get("enable_password").toString())) {
						enablePW = "0";
					}
					userInfo.setEnablePassword(Integer.parseInt(enablePW));
				}
				if (row.get("password") != null) {
					userInfo.setPassword(row.get("password").toString());
				} else {
					userInfo.setPassword("");
				}
				if (row.get("ip") != null) {
					userInfo.setIp(row.get("ip").toString());
				} else {
					userInfo.setIp("");
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			if (ex instanceof EmptyResultDataAccessException) {
				return null;
			}
			throw ex;
		}
		return userInfo;
	}
}
