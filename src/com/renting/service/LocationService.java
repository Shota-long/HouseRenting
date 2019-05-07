package com.renting.service;

import com.opensymphony.xwork2.ActionContext;

public class LocationService {

	public void toSession(String address) {
		ActionContext.getContext().getSession().put("addre", address);
	}


}
