package com.blogtest.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.blogtest.dto.UserListResponseDTO;
import com.blogtest.service.JavaStudyService;
import com.blogtest.service.UserListServiceImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("sessionId")
public class MainController {
	@Autowired
	UserListServiceImpl userListService;
	@Autowired
	JavaStudyService javaStudyservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv) {	
		//Service call//
		
		/*List<UserListResponseDTO> userlist = userListService.getUserListService();
		
		for(int i=0; i<userlist.size(); i++){
			System.out.println("name: " + userlist.get(i).getUserName());
		}
		
		mv.addObject("listuser", userlist);*/
		mv.setViewName("main/mainview");
		
		return mv;
	}
	
	@RequestMapping(value = "/nextpage1", method = RequestMethod.POST)
	public ModelAndView nextpage(ModelAndView mv, Model model, @RequestParam("input_name") String input_name){
		mv.setViewName("main/nextpageview");
		mv.addObject("name", input_name);
		
		model.addAttribute("sessionId", input_name); //세션설정//
	
		System.out.println("input name: " + input_name);
		
		return mv;
	}
	
	@RequestMapping(value = "/nextpage2", method = RequestMethod.POST)
	public ModelAndView nextpage2(ModelAndView mv, HttpServletRequest request){
		mv.setViewName("main/nextpageview");
		mv.addObject("name", request.getParameter("input_name"));
		
		System.out.println("input name: " + request.getParameter("input_name"));
		
		return mv;
	}
	
	@RequestMapping(value = "/javatest", method = RequestMethod.POST)
	public ModelAndView javatest(ModelAndView mv, HttpServletRequest request){
		mv.setViewName("javatest/studyjava");
		
		//1. 객체(Object) //
		javaStudyservice.study_1();
		javaStudyservice.study_2();
		javaStudyservice.study_3();
		javaStudyservice.study_4();
		javaStudyservice.study_5();
		
		return mv;
	}
}
