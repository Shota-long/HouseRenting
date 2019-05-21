package com.forum.web.interceptor;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.renting.domain.User;

public class Intercept_one extends MethodFilterInterceptor{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected String doIntercept(ActionInvocation invocation) throws Exception {
		System.out.println("经过拦截器Intercept_one");
		 User object = (User) ServletActionContext.getContext().getSession().get("login_name");
		 System.out.println("User="+object);
		if(object == null) {
			System.out.println("不放行");
			return "toLogin";
		}
		//放行
		System.out.println("放行");
		return invocation.invoke();
	}

}
