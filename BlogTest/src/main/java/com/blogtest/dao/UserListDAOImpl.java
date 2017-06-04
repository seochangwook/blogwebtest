package com.blogtest.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.blogtest.dto.UserInfoListResponseDTO;
import com.blogtest.dto.UserListRequestDTO;
import com.blogtest.dto.UserListResponseDTO;

@Repository("userListDAO")
public class UserListDAOImpl implements UserListDAO{
	@Autowired
    private SqlSessionTemplate sqlSession;
	@Autowired
	private MongoTemplate mongoTemplate;
	
	private String namespace = "usermanager";

	@Override
	public List<UserListResponseDTO> getUserListdao() {
		System.out.println("dao call");
		
		//리스트를 만든다.//
		List<UserListResponseDTO> userlist = new ArrayList<UserListResponseDTO>();
		
		return userlist = sqlSession.selectList(namespace+".userlist");
	}

	@Override
	public int delUserListdao(UserListRequestDTO userListRequestDTO) {
		System.out.println("dao call del user");
		
		Map<String, Object> userparam = new HashMap<String, Object>();
		userparam.put("username", userListRequestDTO.getDelUserName());
		
		//제거//
		return sqlSession.delete(namespace+".userdelete", userparam);
	}

	@Override
	public List<UserInfoListResponseDTO> getUserListdao_m(Map<String, Object>searchcondition) {
		// TODO Auto-generated method stub
		if(searchcondition.get("option").toString().equals("not")){
			//몽고디비에서는 기본적으로 Query를 이용해서 조건절을 만들고, 조건의 기준은 Criteria를 이용해서 설정한다. 즉 어떤 값으로 비교하겠다를 정의//
			//is말고도 다양한 조건들이 존재//
			Query query = new Query(new Criteria().andOperator(
					Criteria.where("name").is(searchcondition.get("searchname")), 
					Criteria.where("age").is(searchcondition.get("searchage")))); //MongoDB : {name:getName, age:getAge}과 동일//
	
			return mongoTemplate.find(query, UserInfoListResponseDTO.class, "blogtest");
		}
		
		else if(searchcondition.get("option").toString().equals("all")){
			return mongoTemplate.findAll(UserInfoListResponseDTO.class, "blogtest");
		}
		
		return null;
	}
}
