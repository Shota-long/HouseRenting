package com.renting.web;

import java.io.File;
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
import com.renting.domain.Picture;
import com.renting.service.HouseService;

public class HouseAction extends ActionSupport implements ModelDriven<Picture>{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
	Picture picture = (Picture) ac.getBean("picture");
	
	private String houseArray;
	

	public String getHouseArray() {
		return houseArray;
	}

	public void setHouseArray(String houseArray) {
		this.houseArray = houseArray;
	}

	@Test
	public void findHouseInfo() throws IOException {
		
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");//设置编码
		String house_id = ServletActionContext.getRequest().getParameter("house_id");
		String location = ServletActionContext.getRequest().getParameter("location"); //地区
		String minprice = ServletActionContext.getRequest().getParameter("minprice");//最低价格
		String maxprice = ServletActionContext.getRequest().getParameter("maxprice");//最高价格
		String type = ServletActionContext.getRequest().getParameter("type"); //房屋类型
		String rent_way = ServletActionContext.getRequest().getParameter("rent_way"); //出租方式
		String decoration = ServletActionContext.getRequest().getParameter("decoration"); //装修情况
		String flag = ServletActionContext.getRequest().getParameter("flag");
//		System.out.println("house_id:"+house_id+",location:"+location+",minprice:"+minprice+",type:"+type+",rent_way:"+rent_way+",decoration:"+decoration+",flag:"+flag);
		HouseService houseService = new HouseService();
		List<House> result = houseService.findHouseInfo(house_id,location,minprice,maxprice,type,rent_way,decoration,flag);
		//通过json传递数据
		String json = JSON.toJSONString(result,SerializerFeature.DisableCircularReferenceDetect); //将JSON对象转化为JSON字符 ,关闭循环检测
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		writer.write(json);
		writer.flush();
		writer.close();
	}
	
	public void addHouseInfo() {
		
		String[] split = houseArray.split(",");
		HouseService houseService = new HouseService();
		houseService.addHouseInfo(picture,split);
		
	}
	
	public void findPublishInfo() throws IOException {
		
		String json = null;
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");//设置编码
		HouseService houseService = new HouseService();
		if(ServletActionContext.getRequest().getParameter("login_name").equals("管理员")) {
			String houseOwner = ServletActionContext.getRequest().getParameter("houseOwner");
			String location = ServletActionContext.getRequest().getParameter("location");
			String flag = ServletActionContext.getRequest().getParameter("flag");
			Object object = houseService.findPublishInfo(location,houseOwner,flag);
			//String object2 = JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd hh:mm:ss", new SerializerFeature[0]);
			json = JSON.toJSONString(object,SerializerFeature.DisableCircularReferenceDetect); //将JSON对象转化为JSON字符 ,关闭循环检测
			//System.out.println("houseOwner="+houseOwner+"location="+location+"flag="+flag);
		}
		else {
			String houseOwner = ServletActionContext.getRequest().getParameter("login_name");
			String flag = ServletActionContext.getRequest().getParameter("flag");
			List<House> result = houseService.findPublishInfo(houseOwner,flag);
			//通过json传递数据
			json = JSON.toJSONString(result,SerializerFeature.DisableCircularReferenceDetect); //将JSON对象转化为JSON字符 ,关闭循环检测
		
		}
		//System.out.println("json:"+json);
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		writer.write(json);
		writer.flush();
		writer.close();		
	}
	//更新房屋信息
	public void updateHouseInfo() throws IOException {
		String house_id = ServletActionContext.getRequest().getParameter("house_id");
		String flag = ServletActionContext.getRequest().getParameter("flag");
		HouseService houseService = new HouseService();
		int update = houseService.updateHouseInfo(house_id,flag);
		String json = JSON.toJSONString(update,SerializerFeature.DisableCircularReferenceDetect); //将JSON对象转化为JSON字符 ,关闭循环检测
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		writer.write(json);
		writer.flush();
		writer.close();	
	}
	@Override
	public Picture getModel() {
		// TODO Auto-generated method stub
		return picture;
	}
}
