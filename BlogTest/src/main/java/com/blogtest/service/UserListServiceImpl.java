package com.blogtest.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blogtest.dao.UserListDAOImpl;
import com.blogtest.dto.UserInfoListResponseDTO;
import com.blogtest.dto.UserListRequestDTO;
import com.blogtest.dto.UserListResponseDTO;

@Service("userListService")
public class UserListServiceImpl implements UserListService{
	@Autowired
	UserListDAOImpl userListDAO;
	
	@Override
	public List<UserListResponseDTO> getUserListService() {
		System.out.println("service call getUserList");
		
		return userListDAO.getUserListdao();
	}

	@Override
	public List<UserListResponseDTO> delUserListService(UserListRequestDTO userListRequestDTO) {
		System.out.println("service call delUserList");
		
		//제거부분을 추가//
		int deleteresult = userListDAO.delUserListdao(userListRequestDTO);
		
		if(deleteresult == 0){
			System.out.println("delete fail...");
		}
		
		else if(deleteresult == 1){
			System.out.println("delete succcess...");
		}
		
		//다시 리스트를 호출하여 결과를 가져온다.//
		return userListDAO.getUserListdao();
	}

	@Override
	public List<UserInfoListResponseDTO> getUserListService_m(Map<String, Object>searchcondition) {
		// TODO Auto-generated method stub
		return userListDAO.getUserListdao_m(searchcondition);
	}
	
}
