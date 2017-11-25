package com.blogtest.vo;

public class Car {
	private String carName;
	private String carNumber;
	private int carPrice;
	
	public Car() {
		
	}
	
	public Car(String carName, String carNumber, int carPrice) {
		this.carName = carName;
		this.carNumber = carNumber;
		this.carPrice = carPrice;
	}
	
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getCarNumber() {
		return carNumber;
	}
	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}
	public int getCarPrice() {
		return carPrice;
	}
	public void setCarPrice(int carPrice) {
		this.carPrice = carPrice;
	}
	
	public void getCarInfo() {
		System.out.println("car Name: " + this.getCarName());
		System.out.println("car Number: " + this.getCarNumber());
		System.out.println("car Price: " + this.getCarPrice());
	}
	
	public void etcInfo() {
		System.out.println("==> no etc info");
	}
}
