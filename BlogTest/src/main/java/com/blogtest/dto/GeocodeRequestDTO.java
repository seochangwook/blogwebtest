package com.blogtest.dto;

import java.io.Serializable;

public class GeocodeRequestDTO implements Serializable{
	private String address;

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
}
