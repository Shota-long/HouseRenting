package com.renting.domain;

import java.util.Date;

public class BrowseRecord {
	private String browseId;
	private String visitorId;
	private String houseId;
	private Date browseTime;
	private int flag;
	private House house;
	private User user;
	public String getBrowseId() {
		return browseId;
	}
	public void setBrowseId(String browseId) {
		this.browseId = browseId;
	}
	public String getVisitorId() {
		return visitorId;
	}
	public void setVisitorId(String visitorId) {
		this.visitorId = visitorId;
	}
	public String getHouseId() {
		return houseId;
	}
	public void setHouseId(String houseId) {
		this.houseId = houseId;
	}
	public Date getBrowseTime() {
		return browseTime;
	}
	public void setBrowseTime(Date browseTime) {
		this.browseTime = browseTime;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public House getHouse() {
		return house;
	}
	public void setHouse(House house) {
		this.house = house;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
