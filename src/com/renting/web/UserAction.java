package com.renting.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.print.attribute.standard.PageRanges;
import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.jsp.PageContext;

import org.apache.struts2.ServletActionContext;
import org.junit.Test;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.renting.domain.User;
import com.renting.service.UserService;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UserAction extends ActionSupport implements ModelDriven<User>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
	User user = (User) ac.getBean("user");

	//登录
	public String login() throws Exception {
		UserService user_service = new UserService();
		User temp = user_service.findUser(user);
		if(temp != null) {
//			System.out.println("success");
//			System.out.println("权限："+temp.getAuthority());
			if(temp.getAuthority().trim().equals("0")) {
				ServletActionContext.getRequest().getSession().setAttribute("login_name", "管理员");
//				ActionContext.getContext().getSession().put("login_name", "管理员");
//				System.out.println(ActionContext.getContext().getSession().get("login_name"));
				return "toAdmin";
			}
			else if(temp.getAuthority().trim().equals("2")) {
				ServletActionContext.getRequest().getSession().setAttribute("login_name", user.getUsername());
//				ActionContext.getContext().getSession().put("login_name", user.getUsername());
//				System.out.println(ActionContext.getContext().getSession().get("login_name"));
				return "toIndex";
			}
			else
				return null;
			
		}
		else {
			System.out.println("fail");
			ActionContext.getContext().put("error", "用户名或密码错误");
			return "toLogin";
		}
		
	}
	//注册
	public String register() throws Exception {
		
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		String VeCode = (String) ServletActionContext.getRequest().getSession().getAttribute("code"); 
		if(user.getCode().equals(VeCode)) {
			user.setUid(UUID.randomUUID().toString());
			user.setAuthority("2");
			UserService user_service = new UserService();
			boolean success = user_service.addUser(user);
			if(success) {
//				System.out.println("success");
				ServletActionContext.getRequest().getSession().removeAttribute("code");
				return "toLogin";
			}
			else {
//				System.out.println("fail");
				ActionContext.getContext().put("error", "注册失败");
				return "toRegister";
			}
		}
		else {
			ActionContext.getContext().put("error", "验证码错误");
			return "toRegister";
		}
		
	}
	
	//验证用户名是否重复
	public void verifUsername() throws Exception {
		
		String name = ServletActionContext.getRequest().getParameter("username");
		//String name = "lain";
		UserService user_service = new UserService();
		Boolean success = user_service.verifUsername(name);
		if(success) {
//			System.out.println("success");
			ServletActionContext.getResponse().getWriter().append("{\"isSuccess\":"+success+"}");
		}
		else {
			ServletActionContext.getResponse().getWriter().append("{\"isSuccess\":"+success+"}");
		}
	} 
	//退出清空登录用户
	public void removeSession() throws Exception {
		UserService user_service = new UserService();
		user_service.removeSession();
//		System.out.println(ActionContext.getContext().getSession().get("login_name"));
	} 
	//修改密码
	public void updatePwd() throws IOException {
	    String username = ServletActionContext.getRequest().getParameter("username");
	    String password = ServletActionContext.getRequest().getParameter("password");
//	    System.out.println(username+":"+password);
	    UserService user_service = new UserService();
	    int update = user_service.updatePwd(username,password);
	    String json = JSON.toJSONString(update,SerializerFeature.DisableCircularReferenceDetect); //将JSON对象转化为JSON字符 ,关闭循环检测
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		writer.write(json);
		writer.flush();
		writer.close();	
	}
	
	@Override
	public User getModel() {
		return user;
	}

}
