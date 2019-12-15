package com.infini.b2e.config;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.infini.b2e.dao.UserInfiniDAO;
import com.infini.b2e.entity.UserInfini;
import com.infini.b2e.utils.PasswordEncoderUtils;

@Component("authenticationProvider")
public class LimitLoginAuthenticationProvider extends DaoAuthenticationProvider {

    @Autowired
    UserInfiniDAO userInfiniDAO;

    private final int miliseconds = 1000;

    private final int seconds = 60;

    private final int minutes = 60;

    private final int hours = 24;

    private final int miniteUnBlock = 30;

    private final int dateToDisable = 90;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new PasswordEncoderUtils();
    }

    @Autowired
    @Qualifier("userDetailsService")
    @Override
    public void setUserDetailsService(UserDetailsService userDetailsService) {
        super.setUserDetailsService(userDetailsService);
    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        try {
            UserInfini userManage = userInfiniDAO.findUserAccounts(authentication.getName());
            if (userManage != null) {
                Date dateTimeNow = new Date();
                Date lastModified;
                Date lastUpdatedDate = userManage.getLast_password_update_date();
                // get last modified login
                if (userManage.getLast_modified() != null) {
                    lastModified = userManage.getLast_modified();
                    long milisecondsFromLastModified = dateTimeNow.getTime() - lastModified.getTime();
                    if ((milisecondsFromLastModified / miliseconds / seconds) > miniteUnBlock) {
                        userInfiniDAO.resetFailAttempts(authentication.getName());
                    }
                }
                // get miliseconds from last updated password
                long milisecondsFromLastUpdatedDate = dateTimeNow.getTime() - lastUpdatedDate.getTime();
                if ((milisecondsFromLastUpdatedDate / miliseconds / seconds / minutes / hours) > dateToDisable) {
                    throw new DisabledException("Password has expire(90 date), please change password");
                }
                // set passwordEncoder
                super.setPasswordEncoder(passwordEncoder());
                Authentication auth = super.authenticate(authentication);
                userInfiniDAO.resetFailAttempts(authentication.getName());
                return auth;
            } else {
                throw new DisabledException("Acount not valid");
            }
        } catch (BadCredentialsException e) {
            UserInfini userInfini = userInfiniDAO.updateUserFailAttempt(authentication.getName());
            if(!userInfini.isBlock_f()) {
                throw new LockedException("User Account is locked!");
            }
            throw new DisabledException("Acount not valid");
        } catch (LockedException e) {
            // this user is locked!
            String error = "";
            UserInfini UserManager = userInfiniDAO.findUserAccounts(authentication.getName());
            if (UserManager != null) {
                Date lastModified = UserManager.getLast_modified();
                error = "User account is locked! <br>"+ "Last Modified : " + lastModified;
            } else {
                error = e.getMessage();
            }
            throw new LockedException(error);
        }

    }

}
