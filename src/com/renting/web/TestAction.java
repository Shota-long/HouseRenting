package com.renting.web;

import java.io.File;

import javax.annotation.Resource;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.renting.domain.Picture;

public class TestAction	extends ActionSupport implements ModelDriven<Picture> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
	Picture picture = (Picture) ac.getBean("picture");
	
	private String house;

	public String getHouse() {
		return house;
	}

	public void setHouse(String house) {
		this.house = house;
	}

	public void getContent() {
		System.out.println(picture.getFileFileName());
		System.out.println(picture.getFileContentType());
		System.out.println(house);
	}

	@Override
	public Picture getModel() {
		// TODO Auto-generated method stub
		return picture;
	}
}
