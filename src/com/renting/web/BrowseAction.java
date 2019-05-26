package com.renting.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.renting.domain.BrowseRecord;
import com.renting.service.BrowseService;

public class BrowseAction extends ActionSupport implements ModelDriven<BrowseRecord>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
	BrowseRecord record = (BrowseRecord) ac.getBean("browseRecord");
	
	public void browseRecord() throws ParseException {
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");//设置编码
		String username = ServletActionContext.getRequest().getParameter("login_name");
		String houseId = ServletActionContext.getRequest().getParameter("house_id");
		BrowseService service = new BrowseService();
		service.browseRecord(username,houseId);
	}
	
	public void selectRecord() throws IOException {
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");//设置编码
		String username = ServletActionContext.getRequest().getParameter("login_name");
		BrowseService service = new BrowseService();
		Object object = service.selectRecord(username);
		String json = JSON.toJSONString(object,SerializerFeature.DisableCircularReferenceDetect); //将JSON对象转化为JSON字符 ,关闭循环检测
		//System.out.println("json:"+json);
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		writer.write(json);
		writer.flush();
		writer.close();
	}
	
	@Override
	public BrowseRecord getModel() {
		// TODO Auto-generated method stub
		return record;
	}
	
	
}
