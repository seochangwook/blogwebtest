package com.blogtest.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/admin.do", method = RequestMethod.POST)
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("admin/adminview");
		
		System.out.println("security adjust");
	
		return mv;
	}
	
	@RequestMapping(value = "/adminlogin.do", method = RequestMethod.GET)
	public ModelAndView adminlogin(ModelAndView mv) {
		mv.setViewName("admin/adminloginview");
		
		System.out.println("security login adjust");
	
		return mv;
	}
}
