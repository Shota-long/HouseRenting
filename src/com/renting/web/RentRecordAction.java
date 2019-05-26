package com.renting.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.opensymphony.xwork2.ActionSupport;
import com.renting.domain.RentRecord;
import com.renting.service.RentRecordService;

public class RentRecordAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public void insertRecord() throws ParseException, IOException {
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");//设置编码
		String houseId = ServletActionContext.getRequest().getParameter("house_id");
		String lessor = ServletActionContext.getRequest().getParameter("lessor");
		String lessee = ServletActionContext.getRequest().getParameter("lessee");
		String startDate = ServletActionContext.getRequest().getParameter("startDate");
		String endDate = ServletActionContext.getRequest().getParameter("endDate");
		String flag = ServletActionContext.getRequest().getParameter("flag");
		RentRecordService service = new RentRecordService();
		//System.out.println("house_id="+houseId+"lessor="+lessor+"lessee="+lessee+"startDate="+startDate+"endDate="+endDate+"flag="+flag);
		int update = service.insertRecord(houseId,lessor,lessee,startDate,endDate,flag);
		String json = JSON.toJSONString(update,SerializerFeature.DisableCircularReferenceDetect); //将JSON对象转化为JSON字符 ,关闭循环检测
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		writer.write(json);
		writer.flush();
		writer.close();
		
	}
	
	public void selectRecord() throws IOException {
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");//设置编码
		String name = ServletActionContext.getRequest().getParameter("login_name");
		RentRecordService service = new RentRecordService();
		System.out.println("name="+name);
		List<RentRecord> list = service.selectRecord(name);
		String json = JSON.toJSONString(list,SerializerFeature.DisableCircularReferenceDetect); //将JSON对象转化为JSON字符 ,关闭循环检测
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		writer.write(json);
		writer.flush();
		writer.close();
	}

}
