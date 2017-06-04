package com.blogtest.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.blogtest.dto.EmailDTO;
import com.blogtest.dto.GeocodeRequestDTO;
import com.blogtest.dto.UserInfoListResponseDTO;
import com.blogtest.dto.UserListRequestDTO;
import com.blogtest.dto.UserListResponseDTO;
import com.blogtest.service.UserListServiceImpl;
import com.blogtest.service.UserModifyServiceImpl;
import com.blogtest.util.MailUtil;
import com.blogtest.util.MapUtil;


@Controller
@SessionAttributes("sessionId")
public class AjaxController {
	@Autowired
	UserListServiceImpl userListService;
	@Autowired
	UserModifyServiceImpl userModifyService;
	@Autowired
	MapUtil maputil;
	@Autowired
	MailUtil mailutil;
	@Autowired
	EmailDTO emaildto;
	
	@RequestMapping(value = "/tablereload", method = RequestMethod.POST, produces = {"application/json"})
	public @ResponseBody Map<String, Object> tablereload(@RequestBody UserListRequestDTO userListRequestDTO) {	
		System.out.println("ajax service call data:[" + userListRequestDTO.getDelUserName() + "]");
		
		Map<String, Object> retVal = new HashMap<String, Object>(); //반환할 타입의 클래스를 선언//
		
		//Service call//
		List<UserListResponseDTO> userlist = userListService.delUserListService(userListRequestDTO);
		
		for(int i=0; i<userlist.size(); i++){
			System.out.println("username: " + userlist.get(i).getUserName());
		}
		
		retVal.put("check", "success call");
		retVal.put("list", userlist);
		
		return retVal;
	}
	
	@RequestMapping(value = "/getsessionajax", method = RequestMethod.POST, produces = {"application/json"})
	public @ResponseBody Map<String, Object> getSession(HttpSession session,@RequestBody Map<String, Object> info) {	
		boolean isSeesion = false;
		
		Map<String, Object> retVal = new HashMap<String, Object>(); //반환할 타입의 클래스를 선언//
		
		//System.out.println("session name:" + info.get("name"));
		
		//세션검증//
		String sessionVal = ""+session.getAttribute("sessionId");
		
		if(sessionVal != null){
			retVal.put("sessionval", session.getAttribute("sessionId"));
		}
		
		return retVal;
	}
	
	@RequestMapping(value = "/logoutajax", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> logout(SessionStatus status) {	
		boolean is_insert_success = false;
		
		System.out.println("logout call");
		
		// 세션종료//
		// SessionStatus는 스프링의 어노테이션으로 지원되는 @SessionAttributes의 세션을 만료시킨다.//
		status.setComplete();

		if (status.isComplete() == true) {
			System.out.println("Session remove success...");

			is_insert_success = true;
		}
		
		Map<String, Object> retVal = new HashMap<String, Object>(); //반환할 타입의 클래스를 선언//
		
		retVal.put("check", ""+is_insert_success);
		
		return retVal;
	}
	
	@RequestMapping(value = "/logoutsecurityajax", method = RequestMethod.POST)
	public @ResponseBody String logout(HttpServletRequest request, HttpServletResponse response) {
		boolean is_insert_success = false;

		//로그아웃//
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		//로그아웃 상태인지 점검//
		if(auth != null){
			 new SecurityContextLogoutHandler().logout(request, response, auth);
			 
			 is_insert_success = true;
		}
		
		return "" + is_insert_success;
	}
	
	@RequestMapping(value = "/geocoderajax", method = RequestMethod.POST, produces = {"application/json"})
	public @ResponseBody Map<String, Object> GeocoderService(@RequestBody final  GeocodeRequestDTO geocodeRequestdto) { 
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		System.out.println("address: " + geocodeRequestdto.getAddress());
		
		//지오코딩을 하는 서비스 호출//
		Float[] coords = maputil.geoCoding(geocodeRequestdto);
		
		//반환된 좌표값을 해시값에 채운다.//
		retVal.put("id", "success");
		retVal.put("latitude", ""+coords[0]);
		retVal.put("longitude", coords[1]);
			
		return retVal;
	}
	
	@RequestMapping(value = "/mongoinputajax", method = RequestMethod.POST, produces = {"application/json"})
	public @ResponseBody Map<String, Object> MongoInputService(@RequestBody Map<String, Object> info) { 
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		System.out.println("m_name: " + info.get("name"));
		System.out.println("m_age: " + info.get("age"));
		
		//등록 서비스 호출//
		userModifyService.insertuserinfo(info);
		
		retVal.put("val", "1");
			
		return retVal;
	}
	
	@RequestMapping(value = "/mongolistajax", method = RequestMethod.POST, produces = {"application/json"})
	public @ResponseBody Map<String, Object> MongoListService(@RequestBody Map<String, Object> searchcondition) { 
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		System.out.println("mongo list ajax call" + "/ " + searchcondition.get("searchname"));
		
		//등록 서비스 호출//
		List<UserInfoListResponseDTO> userlist = userListService.getUserListService_m(searchcondition);
		
		if(userlist == null){
			System.out.println("not option");
		}
		
		else{
			for(int i=0; i<userlist.size(); i++){
				System.out.println("name: " + userlist.get(i).getName() + "/ age: " + userlist.get(i).getAge());
			}
		}
		
		retVal.put("val", "1");
			
		return retVal;
	}
	
	@RequestMapping(value = "/enrollajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> enrollStudent(MultipartHttpServletRequest multi) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		System.out.println("------------------<<File Upload>>---------------------");

		// 저장 경로 설정
		String root = multi.getSession().getServletContext().getRealPath("/");
		String path = root + "resources/upload/";

		File dir = new File(path);

		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		// 전송된 파일들(getFileNames)을 불러오기 위한 반복자(Formdata 탐색)//
		Iterator<String> files = multi.getFileNames();

		while (files.hasNext()) {
			String uploadFile = files.next();
           
		    MultipartFile mFile = multi.getFile(uploadFile);
		    
		    String fileName_original = mFile.getOriginalFilename();
		    //현재 프로젝트(서버)의 resources 경로//
		    String file_save_path = "/Users/macbook/git/BlogTest/src/main/webapp/resources/upload/";
		             
		    try {
		    	mFile.transferTo(new File(file_save_path+fileName_original));
		    	
		    	System.out.println("전송된 파일 이름 : " +fileName_original);
			    //System.out.println("파일 이름: " + newFileName);
			    System.out.println("파일 사이즈: " + mFile.getSize());
				
				System.out.println("------------------------------------------------------");

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 파일 이외의 text데이터//
		System.out.println("subject: " + multi.getParameter("subject"));
		System.out.println("content: " + multi.getParameter("content"));
		
		//사용자 디비정보를 참조할 수 있다.//
		emaildto.setReciver("scw05313315@gmail.com");
		emaildto.setSubject("Bologtest");
		emaildto.setContent("Enroll success...");
		
		try {
			mailutil.SendEmail(emaildto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		retVal.put("retVal", "true");
		
		return retVal;
	}
}
