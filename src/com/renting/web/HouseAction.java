package com.renting.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.renting.domain.House;
import com.renting.service.HouseService;

public class HouseAction extends ActionSupport implements ModelDriven<House> {
	
	
	ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
	House house = (House) ac.getBean("house");
	
	private String houseArray;

	public String getHouseArray() {
		return houseArray;
	}

	public void setHouseArray(String houseArray) {
		this.houseArray = houseArray;
	}
	
	@Test
	public void findHouseInfo() throws IOException {
		System.out.println("/////////////////////////执行action");
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");//设置编码
		String house_id = ServletActionContext.getRequest().getParameter("house_id");
		String location = (String) ActionContext.getContext().getSession().get("location"); //情况
		String minprice = ServletActionContext.getRequest().getParameter("minprice");//最低价格
		String maxprice = ServletActionContext.getRequest().getParameter("maxprice");//最高价格
		String type = ServletActionContext.getRequest().getParameter("type"); //房屋类型
		String rent_way = ServletActionContext.getRequest().getParameter("rent_way"); //出租方式
		String decoration = ServletActionContext.getRequest().getParameter("decoration"); //装修情况
		String flag = ServletActionContext.getRequest().getParameter("flag");
		System.out.println("house_id:"+house_id+",location:"+location+",minprice:"+minprice+",type:"+type+",rent_way:"+rent_way+",decoration:"+decoration+"flag:"+flag);
		HouseService houseService = new HouseService();
		List<House> result = houseService.findHouseInfo(house_id,location,minprice,maxprice,type,rent_way,decoration,flag);
		//通过json传递数据
		String json = JSON.toJSONString(result,SerializerFeature.DisableCircularReferenceDetect); //将JSON对象转化为JSON字符 ,关闭循环检测
		//System.out.println("json:"+json);
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		writer.write(json);
		writer.flush();
		writer.close();
	}
	
	public void addHouseInfo() {
		String[] split = houseArray.split(",");
//		for (String string : split) {
//			System.out.println(string);
//		}
		HouseService houseService = new HouseService();
		houseService.addHouseInfo(split);
	}
	
	@Override
	public House getModel() {
		// TODO Auto-generated method stub
		return house;
	}
	
}
