package com.blogtest.vo;

public class Texi extends Car{
	private String texiNumber;
	private int passengerCount;
	
	public Texi() {
		
	}
	
	public Texi(String carName, String carNumber, int carPrice) {
		super(carName, carNumber, carPrice);
	}

	public String getTexiNumber() {
		return texiNumber;
	}

	public void setTexiNumber(String busNumber) {
		this.texiNumber = busNumber;
	}

	public int getPassengerCount() {
		return passengerCount;
	}

	public void setPassengerCount(int passengerCount) {
		this.passengerCount = passengerCount;
	}
	
	@Override
	public void getCarInfo() {
		super.getCarInfo();
		
		System.out.println("Texi Number: " + this.getTexiNumber());
		System.out.println("Texi PassengerCount: " + this.getPassengerCount());
	}
}
