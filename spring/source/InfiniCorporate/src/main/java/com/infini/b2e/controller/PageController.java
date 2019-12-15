package com.infini.b2e.controller;

import java.security.Principal;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.infini.b2e.common.BaseController;
import com.infini.b2e.utils.WebUtils;

@Controller
public class PageController extends BaseController{
	/**
	 * @param model
	 * @param error
	 * @return
	 */
	@RequestMapping(value = {"/" , "/login"}, method = RequestMethod.GET)
	public String login(Model model, @RequestParam(name="error", required= false) String error) {
		model.addAttribute("title", "Login admin infini");
		model.addAttribute("message", "This is login page!");
		return "login";
	}

	/**
	 * @param model
	 * @param principal
	 * @return
	 */
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accessDenied(Model model, Principal principal) {
		if (principal != null) {
			User loginedUser = (User) ((Authentication) principal).getPrincipal();
			String userInfo = WebUtils.toString(loginedUser);
			model.addAttribute("userInfo", userInfo);
			String message = "You do not have permission to access this page!";
			model.addAttribute("message", message);
		}
		return "403";
	}

}
