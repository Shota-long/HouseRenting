package com.renting.web;

import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.print.attribute.standard.PageRanges;
import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.jsp.PageContext;

import org.apache.struts2.ServletActionContext;
import org.junit.Test;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.renting.domain.User;
import com.renting.service.UserService;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UserAction extends ActionSupport implements ModelDriven<User>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
	User user = (User) ac.getBean("user");

	public String login() throws Exception {
		UserService user_service = new UserService();
		User temp = user_service.findUser(user);
		if(temp != null) {
			System.out.println("success");
			System.out.println("权限："+temp.getAuthority());
			if(temp.getAuthority().trim().equals("0")) {
				ActionContext.getContext().getSession().put("login_name", "管理员");
				System.out.println(ActionContext.getContext().getSession().get("login_name"));
				return "toAdmin";
			}
			else if(temp.getAuthority().trim().equals("2")) {
				ActionContext.getContext().getSession().put("login_name", user.getUsername());
				System.out.println(ActionContext.getContext().getSession().get("login_name"));
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
	
	public String register() throws Exception {
		user.setUid(UUID.randomUUID().toString());
		user.setAuthority("2");
		UserService user_service = new UserService();
		boolean success = user_service.addUser(user);
		if(success) {
			System.out.println("success");
			return "toLogin";
		}
		else {
			System.out.println("fail");
			ActionContext.getContext().put("error", "注册失败");
			return "toRegister";
		}
		
	}
	
	@Test
	public void verifUsername() throws Exception {
		System.out.println("222222");
		String name = ServletActionContext.getRequest().getParameter("username");
		//String name = "lain";
		UserService user_service = new UserService();
		Boolean success = user_service.verifUsername(name);
		if(success) {
			System.out.println("success");
			ServletActionContext.getResponse().getWriter().append("{\"isSuccess\":"+success+"}");
		}
		else {
			ServletActionContext.getResponse().getWriter().append("{\"isSuccess\":"+success+"}");
		}
	} 
	
	public void removeSession() throws Exception {
		UserService user_service = new UserService();
		user_service.removeSession();
		System.out.println(ActionContext.getContext().getSession().get("login_name"));
	} 
	
	@Override
	public User getModel() {
		return user;
	}

}
