package com.d2e.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class BaseController {

	@ModelAttribute("username")
	public String userName() {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		return username;
	}
	
}