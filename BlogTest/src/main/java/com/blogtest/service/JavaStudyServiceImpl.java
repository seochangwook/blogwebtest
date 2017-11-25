package com.blogtest.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.blogtest.vo.Bus;
import com.blogtest.vo.Car;
import com.blogtest.vo.Student;
import com.blogtest.vo.Teacher;
import com.blogtest.vo.Texi;

@Service
public class JavaStudyServiceImpl implements JavaStudyService{

	@Override
	public void study_1() {
		System.out.println("--------------------<Study 1>--------------------");
	
		Car myCar = new Car();
		
		myCar.setCarName("Sonata");
		myCar.setCarNumber("CAR11112222");
		myCar.setCarPrice(1000);
		
		System.out.println("Object value: " + myCar);
		myCar.getCarInfo();
		
		System.out.println("-------------------------------------------------");
	}

	@Override
	public void study_2() {
		System.out.println("--------------------<Study 2>--------------------");
		
		Bus myBus = new Bus("miniBus", "CAR11112222", 1000);
		
		myBus.setBusNumber("BUS11112222");
		myBus.setPassengerCount(100);
		
		System.out.println("Object value: " + myBus);
		myBus.getCarInfo();
		
		System.out.println();
		
		Texi myTexi = new Texi("minitexi", "CAR22223333", 2000);
		
		myTexi.setTexiNumber("TEXI11112222");
		myTexi.setPassengerCount(50);
		
		System.out.println("Object: " + myTexi);
		myTexi.getCarInfo();
		
		System.out.println("-------------------------------------------------");
	}

	@Override
	public void study_3() {
		System.out.println("--------------------<Study 3>--------------------");
		
		Student student = new Student();
		
		student.setStuName("서창욱");
		student.setStuAge(26);
		
		System.out.println(student.toString());
		student.schoolName();
		student.schoolAddress();
		
		System.out.println();
		
		Teacher teacher = new Teacher();
		
		teacher.setTeacherName("홍길동");
		teacher.setTeacherAge(40);
	
		System.out.println(teacher.toString());
		teacher.schoolName();
		teacher.schoolAddress();
		
		System.out.println("-------------------------------------------------");
	}

	@Override
	public void study_4() {
		System.out.println("--------------------<Study 4>--------------------");
		
		Car car_bus = new Bus();
		Car car_texi = new Texi();
		
		car_bus.etcInfo();
		car_texi.etcInfo();
		
		System.out.println("-------------------------------------------------");
	}

	@Override
	public void study_5() {
		System.out.println("--------------------<Study 5>--------------------");
		
		//Map//
		Map<String, Object> dataset = new HashMap<String, Object>();
		
		dataset.put("one", "1");
		dataset.put("two", "2");
		dataset.put("three", "3");
		dataset.remove("one");
		
		System.out.println("value: " + dataset.get("one"));
		System.out.println("value: "  +dataset.get("two"));
		
		System.out.println();
		
		//List//
		List<Object> datalist = new ArrayList<Object>();
		
		datalist.add("1");
		datalist.add("2");
		datalist.add("3");
		datalist.add("4");
		datalist.add("5");
		
		for(int i=0; i<datalist.size(); i++) {
			System.out.println("pre value: " + datalist.get(i));
		}
		
		datalist.remove("2");
		
		for(int i=0; i<datalist.size(); i++) {
			System.out.println("ori value: " + datalist.get(i));
		}
		
		System.out.println();
		
		//Map + List//
		Map<String, ArrayList<Object>> datasetlist = new HashMap<String, ArrayList<Object>>();
		
		ArrayList<Object> namelist = new ArrayList<Object>();
		
		namelist.add("서창욱");
		namelist.add("홍길동");
		namelist.add("임꺽정");
		
		datasetlist.put("name", namelist);
		
		ArrayList<Object> agelist = new ArrayList<Object>();
		
		agelist.add(26);
		agelist.add(30);
		agelist.add(50);
		
		datasetlist.put("age", agelist);
		
		System.out.println(datasetlist);
		
		for(int i=0; i<datasetlist.get("name").size(); i++) {
			System.out.println("name: " + datasetlist.get("name").get(i) + " / age: " + datasetlist.get("age").get(i));
		}
	}
}
