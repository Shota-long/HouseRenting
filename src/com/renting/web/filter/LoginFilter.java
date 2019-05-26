package com.renting.web.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		
		System.out.println("过滤器销毁");
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		//类型转换
		HttpServletRequest request = (HttpServletRequest) req;
		request.setCharacterEncoding("UTF-8");
		HttpServletResponse response = (HttpServletResponse) resp;
		response.setContentType("text/html; charset=UTF-8");
		List<String> list = new ArrayList<String>();   //将不需要过滤的请求放到List中
		list.add("/login.jsp"); //登录页面
		list.add("/register.jsp");//注册页面
		list.add("/index.jsp");//首页
		list.add("/houseInforList.jsp");//租房信息列表
		list.add("/houseInfor.jsp");//具体租房信息页面
		list.add("layui.css");
		list.add("layui.js");
		list.add(".png");
		list.add(".jpg");
		String url = request.getContextPath();
		String path = request.getServletPath();
		//判断请求是否需要过滤
		for (String object : list) {
			//将path与list中不需要过滤的url进行比较，true则放行
			if (path.endsWith(object)) {
				chain.doFilter(request, response);
				return;
			}
		}

		Object user = request.getSession().getAttribute("login_name");
		if(user == null || user == "") {
			response.sendRedirect(url+"/Login/login.jsp");
			return;
		}
		else {
			chain.doFilter(request, response);
			return;
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	
		System.out.println("过滤器初始化");
	}

}
