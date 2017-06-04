package com.blogtest.service;

import java.util.List;
import java.util.Map;

import com.blogtest.dto.UserInfoListResponseDTO;
import com.blogtest.dto.UserListRequestDTO;
import com.blogtest.dto.UserListResponseDTO;

public interface UserListService {
	public List<UserListResponseDTO> getUserListService();
	public List<UserListResponseDTO> delUserListService(UserListRequestDTO userListRequestDTO);
	public List<UserInfoListResponseDTO> getUserListService_m(Map<String, Object>searchcondition);
}
