package com.renting.web;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.opensymphony.xwork2.ActionContext;
import com.renting.service.LocationService;

public class LocationAction {
	public void toSession() {
		String address = ServletActionContext.getRequest().getParameter("address");
		LocationService locationService = new LocationService();
		locationService.toSession(address);
		//System.out.println("Location:"+ActionContext.getContext().getSession().get("location"));
	}
	public void getCoordinate() throws IOException {
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");//设置编码
		String address = ServletActionContext.getRequest().getParameter("address");
		LocationService locationService = new LocationService();
		String[] result = locationService.getCoordinate(address);
		//通过json传递数据
		String json = JSON.toJSONString(result,SerializerFeature.DisableCircularReferenceDetect); //将JSON对象转化为JSON字符 ,关闭循环检测
		System.out.println("json1:"+json);
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		writer.write(json);
		writer.flush();
		writer.close();
	}
}
