package com.d2e.controller;

import java.security.Principal;

import com.d2e.dao.AppUserDAO;
import com.d2e.dao.ChatMessageDAO;
import com.d2e.dao.GroupDAO;
import com.d2e.entity.AppUser;
import com.d2e.entity.Group;
import com.d2e.utils.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
@Controller
public class MainController {
	
	@Autowired
	private GroupDAO groupDAO;
	
	@Autowired
	private AppUserDAO appUserDAO;
	
	@Autowired
	private ChatMessageDAO chatMessageDAO;
	
	@RequestMapping(value = { "/chat" }, method = RequestMethod.GET)
    public String chatPage(Model model, Principal principal) {
		Group group = new Group();
		groupDAO.insertGroup(group);
        return "redirect:/chat/" + group.getGroup_id();
    }
	
    @RequestMapping(value = { "/chat/{room_id}" }, method = RequestMethod.GET)
    public String welcomePage(Model model, Principal principal, @PathVariable("room_id") String room_id) {
    	AppUser user = appUserDAO.findUserAccount(principal.getName());
    
        model.addAttribute("title", "Chat");
        model.addAttribute("username", user.getUserName());
        model.addAttribute("userId", user.getUserId());
        model.addAttribute("room_id", room_id);
        model.addAttribute("userId", user.getUserId());
        model.addAttribute("messageHistory", chatMessageDAO.getAll());
        return "chat";
    }
 
//    @RequestMapping(value = "/admin", method = RequestMethod.GET)
//    public String adminPage(Model model, Principal principal) {
//         
//        User loginedUser = (User) ((Authentication) principal).getPrincipal();
// 
//        String userInfo = WebUtils.toString(loginedUser);
//        model.addAttribute("userInfo", userInfo);
//         
//        return "adminPage";
//    }
 
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage(Model model) {
    	BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
    	System.out.println(bCryptPasswordEncoder.encode("123456"));
        return "login";
    }
    
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model, Principal principal) {
    	model.addAttribute("user_name", principal.getName());
        return "index";
    }
 
    @RequestMapping(value = "/logoutSuccessful", method = RequestMethod.GET)
    public String logoutSuccessfulPage(Model model) {
        model.addAttribute("title", "Logout");
        return "logoutSuccessfulPage";
    }
 
    @RequestMapping(value = "/userInfo", method = RequestMethod.GET)
    public String userInfo(Model model, Principal principal) {
 
        // Sau khi user login thanh cong se co principal
        String userName = principal.getName();
 
        System.out.println("User Name: " + userName);
 
        User loginedUser = (User) ((Authentication) principal).getPrincipal();
 
        String userInfo = WebUtils.toString(loginedUser);
        model.addAttribute("userInfo", userInfo);
 
        return "userInforPage";
    }
 
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public String accessDenied(Model model, Principal principal) {
 
        if (principal != null) {
            User loginedUser = (User) ((Authentication) principal).getPrincipal();
 
            String userInfo = WebUtils.toString(loginedUser);
 
            model.addAttribute("userInfo", userInfo);
 
            String message = "Hi " + principal.getName() //
                    + "<br> You do not have permission to access this page!";
            model.addAttribute("message", message);
 
        }
 
        return "403Page";
    }
}