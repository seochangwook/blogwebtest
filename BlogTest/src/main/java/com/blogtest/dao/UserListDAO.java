package com.blogtest.dao;

import java.util.List;
import java.util.Map;

import com.blogtest.dto.UserInfoListResponseDTO;
import com.blogtest.dto.UserListRequestDTO;
import com.blogtest.dto.UserListResponseDTO;

public interface UserListDAO {
	public List<UserListResponseDTO> getUserListdao();
	public int delUserListdao(UserListRequestDTO userListRequestDTO);
	public List<UserInfoListResponseDTO> getUserListdao_m(Map<String, Object>searchcondition);
}
