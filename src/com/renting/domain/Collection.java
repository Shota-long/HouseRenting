package com.renting.domain;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class Collection {
	
	private Integer collect_id;
	private String user_id;
	private Integer house_id;
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date collect_time;
	public Integer getCollect_id() {
		return collect_id;
	}
	public void setCollect_id(Integer collect_id) {
		this.collect_id = collect_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Integer getHouse_id() {
		return house_id;
	}
	public void setHouse_id(Integer house_id) {
		this.house_id = house_id;
	}
	public Date getCollect_time() {
		return collect_time;
	}
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	public void setCollect_time(Date collect_time) {
		this.collect_time = collect_time;
	}
	
	
	
}
