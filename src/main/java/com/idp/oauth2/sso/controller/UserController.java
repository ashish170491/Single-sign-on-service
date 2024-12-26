package com.idp.oauth2.sso.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class UserController {
	
	@GetMapping("/principal")
	@ResponseBody
	public Principal user(Principal principal) {
		// save the user login count info
		return principal;
	}
	
	
	@GetMapping("/login")
	public String login(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		
		//model.addAttribute("languages", userDao.getAllLanguages());
		model.addAttribute("defaultPage", "login");
		return "login";
	}
	

}
