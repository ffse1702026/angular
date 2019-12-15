package com.infini.b2e.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomizeAuthenticationFailureHandler implements AuthenticationFailureHandler {

	/**
	* @see org.springframework.security.web.authentication.AuthenticationFailureHandler#onAuthenticationFailure(javax.servlet.http.HttpServletRequest,
	*javax.servlet.http.HttpServletResponse,
	*org.springframework.security.core.AuthenticationException)
	*/
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
		response.setStatus(HttpServletResponse.SC_OK);
		response.sendRedirect(request.getContextPath().trim() + "/Redirect.do?method=goRedirect");
	}
}

