package com.blogtest.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blogtest.dao.UserModifyDAOImpl;
@Service("userModifyService")
public class UserModifyServiceImpl implements UserModifyService{
	@Autowired
	UserModifyDAOImpl userModifyDAO;
	
	@Override
	public void insertuserinfo(Map<String, Object> userinfo) {
		// TODO Auto-generated method stub
		System.out.println("userinfo insert service call");
		
		userModifyDAO.insertuserdao(userinfo);
	}
	
}
