package com.renting.web;

import java.io.IOException;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.renting.domain.Picture;
import com.renting.service.uploadPicService;

public class uploadPicAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
//	ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
//	Picture picture = (Picture) ac.getBean("picture");

	
	
	public void uploadPic(String house_id, Picture picture) {
		uploadPicService uploadService = new uploadPicService();
		uploadService.uploadPic(house_id,picture);
	}
//	@Override
//	public Picture getModel() {
//		// TODO Auto-generated method stub
//		return picture;
//	}
}
