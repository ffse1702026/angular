package com.infini.b2e.utils;

import org.springframework.security.crypto.password.PasswordEncoder;

public class PasswordEncoderUtils implements PasswordEncoder{

    @Override
    public String encode(CharSequence rawPassword) {
        // TODO Auto-generated method stub
        return rawPassword.toString();
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        // TODO Auto-generated method stub
        return rawPassword.toString().equals(encodedPassword);
    }


}
