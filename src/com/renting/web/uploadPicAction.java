package com.renting.web;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.renting.domain.Picture;
import com.renting.domain.User;
import com.renting.service.uploadPicService;

public class uploadPicAction extends ActionSupport implements ModelDriven<Picture>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
	Picture picture = (Picture) ac.getBean("picture");
	
	//把图片复制到服务器，并把路径存储到数据库
	public void uploadPic() {
		uploadPicService uploadService = new uploadPicService();
		uploadService.uploadPic(picture);
	}

	@Override
	public Picture getModel() {
		// TODO Auto-generated method stub
		return picture;
	}
}
