package com.renting.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.renting.domain.House;
import com.renting.service.HouseService;

public class HouseAction extends ActionSupport implements ModelDriven<House> {
	
	
	ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
	House house = (House) ac.getBean("house");
	
	@Test
	public void findHouseInfo() throws IOException {
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");//设置编码
		String location = (String) ActionContext.getContext().getSession().get("location");
		HouseService houseService = new HouseService();
		List<House> result = houseService.findHouseInfo(location);
		//通过json传递数据
		String json = JSON.toJSONString(result); //将JSON对象转化为JSON字符 
		System.out.println("json:"+json);
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		writer.write(json);
		writer.flush();
		writer.close();
	}
	@Override
	public House getModel() {
		// TODO Auto-generated method stub
		return house;
	}
	
}
