package com.renting.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.renting.domain.Collection;
import com.renting.domain.House;
import com.renting.service.CollectionService;

public class CollectionAction extends ActionSupport implements ModelDriven<Collection>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Resource(name="collection")
	private Collection collect;
	//查询收藏夹记录
	public void findCollection() throws IOException {
		
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");//设置编码
		String house_id = ServletActionContext.getRequest().getParameter("house_id");
		String username = ServletActionContext.getRequest().getParameter("login_name");
		System.out.println("house_id:"+house_id+"username:"+username);
		CollectionService service = new CollectionService();
		boolean result = service.findCollection(house_id,username);
		if(result) {
			//System.out.println(result);
			PrintWriter writer = ServletActionContext.getResponse().getWriter();
			String exist = "exist";
			writer.write(exist);
			writer.flush();
			writer.close();
		}
	}
	//添加收藏记录
	public void addCollection() throws IOException{
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");//设置编码
		String house_id = ServletActionContext.getRequest().getParameter("house_id");
		String username = ServletActionContext.getRequest().getParameter("login_name");
		CollectionService service = new CollectionService();
		boolean result = service.addCollection(house_id,username);
		if(result) {
			//System.out.println(result);
			PrintWriter writer = ServletActionContext.getResponse().getWriter();
			String addSuccess = "addSuccess";
			writer.write(addSuccess);
			writer.flush();
			writer.close();
		}
	}
	//删除收藏记录
	public void deleteCollection() throws IOException{
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");//设置编码
		String house_id = ServletActionContext.getRequest().getParameter("house_id");
		String username = ServletActionContext.getRequest().getParameter("login_name");
		CollectionService service = new CollectionService();
		boolean result = service.deleteCollection(house_id,username);
		if(result) {
			//System.out.println(result);
			PrintWriter writer = ServletActionContext.getResponse().getWriter();
			String delSuccess = "delSuccess";
			writer.write(delSuccess);
			writer.flush();
			writer.close();
		}
		
	}
	
	public void findCollectMsg() throws IOException {
		System.out.println("findCollectMsg");
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");//设置编码
		String username = ServletActionContext.getRequest().getParameter("login_name");
		CollectionService service = new CollectionService();
		List<House> result = service.findCollection(username);
		//if(result.size() != 0) {
			String json = JSON.toJSONString(result,SerializerFeature.DisableCircularReferenceDetect); //将JSON对象转化为JSON字符 ,关闭循环检测
			System.out.println("json:"+json);
			PrintWriter writer = ServletActionContext.getResponse().getWriter();
			writer.write(json);
			writer.flush();
			writer.close();
		//}
	}
	
	@Override
	public Collection getModel() {
		return collect;
	}
	/*
	public String Test() throws IOException{
		//Map<String,Object> map = new HashMap<String, Object>();
		//map.put("1", "123");
		String f ="1";
		ServletActionContext.getResponse().getWriter().print(f);
		return "test";
		
	}
	*/
	
}
