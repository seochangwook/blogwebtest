package com.blogtest.dto;

import java.io.Serializable;

public class UserListRequestDTO implements Serializable{
	private String delUserName;

	public String getDelUserName() {
		return delUserName;
	}

	public void setDelUserName(String delUserName) {
		this.delUserName = delUserName;
	}
}
