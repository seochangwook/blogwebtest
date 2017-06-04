package com.blogtest.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

@Repository("userModifyDAO")
public class UserModifyDAOImpl implements UserModifyDAO{
	@Autowired
	private MongoTemplate mongoTemplate;
	
	@Override
	public void insertuserdao(Map<String, Object> userinfo) {
		// TODO Auto-generated method stub
		mongoTemplate.insert(userinfo, "blogtest");
		
		System.out.println("insert success...");
	}

}
