package com.renting.web;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.renting.service.LocationService;

public class LocationAction {
	public void toSession() {
		String address = ServletActionContext.getRequest().getParameter("address");
		LocationService locationService = new LocationService();
		locationService.toSession(address);
		System.out.println(ActionContext.getContext().getSession().get("addre"));
	}
}
