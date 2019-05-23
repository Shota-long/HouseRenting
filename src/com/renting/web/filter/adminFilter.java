package com.renting.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class adminFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		//类型转换
		HttpServletRequest request = (HttpServletRequest) req;
		request.setCharacterEncoding("UTF-8");
		HttpServletResponse response = (HttpServletResponse) resp;
		response.setContentType("text/html; charset=UTF-8");
		String path = request.getServletPath();
		String url = request.getContextPath();
		if(path.endsWith("adminPage.jsp")) {
			if(request.getSession().getAttribute("login_name").equals("管理员")) {
				chain.doFilter(request, response);
			}
			else
				response.sendRedirect(url+"/Login/login.jsp");
				return;
		}
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
