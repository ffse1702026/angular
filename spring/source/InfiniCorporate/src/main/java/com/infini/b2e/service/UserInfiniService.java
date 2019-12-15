package com.infini.b2e.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.infini.b2e.dao.UserInfiniDAO;
import com.infini.b2e.entity.UserInfini;

@Service("userDetailsService")
public class UserInfiniService implements UserDetailsService {
	@Autowired
	private UserInfiniDAO usermanagerDAO;
	
	@Autowired
	PasswordEncoder PasswordEncoder;
	
	@Override
	public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {
		UserInfini usermanager = this.usermanagerDAO.findUserAccounts(user_id);
		
		if (usermanager == null) {
			throw new UsernameNotFoundException("User " + user_id + " was not found in the database");
		}
		usermanager.setPassword(PasswordEncoder.encode(usermanager.getPassword()));
		UserDetails usersDetails = (UserDetails) new User(usermanager.getUser_id(), PasswordEncoder.encode(usermanager.getPassword()), true, true, true, usermanager.isBlock_f(), AuthorityUtils.createAuthorityList("ROLE_USER"));

		return usersDetails;
	}
}
