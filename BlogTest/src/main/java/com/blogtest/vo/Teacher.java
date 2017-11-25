package com.blogtest.vo;

public class Teacher implements SchoolInfo{
	private String teacherName;
	private int teacherAge;
	
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public int getTeacherAge() {
		return teacherAge;
	}
	public void setTeacherAge(int teacherAge) {
		this.teacherAge = teacherAge;
	}
	
	@Override
	public String toString() {
		return "Teacher [teacherName=" + teacherName + ", teacherAge=" + teacherAge + "]";
	}
	
	@Override
	public void schoolName() {
		System.out.println("School Name is HighSchool");
	}
	@Override
	public void schoolAddress() {
		System.out.println("School Address is Seoul");		
	}
}
