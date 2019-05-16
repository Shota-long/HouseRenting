package com.renting.domain;

import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.annotation.JSONField;

public class House {
	private int house_id; //id
	private String user_id;//用户id
	private String title; //租房信息标题
	private String location;  //所属区域
	private int price;	 // 租金
	private String deposit_way;	//押金方式
	private String rent_way; //出租方式
	private String type;  //房屋类型
	private int area;  //面积
	private String decoration; // 装修程度
	private int floor;		//所在楼层
	private String address; //具体地址
	private String description; //详细描述
	private Double grade; //评分
	private User user;//
	private List<Picture> picList;//
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date collect_time; 
	private int flag;
	
	public int getHouse_id() {
		return house_id;
	}
	public void setHouse_id(int house_id) {
		this.house_id = house_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDeposit_way() {
		return deposit_way;
	}
	public void setDeposit_way(String deposit_way) {
		this.deposit_way = deposit_way;
	}
	public String getRent_way() {
		return rent_way;
	}
	public void setRent_way(String rent_way) {
		this.rent_way = rent_way;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getArea() {
		return area;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public String getDecoration() {
		return decoration;
	}
	public void setDecoration(String decoration) {
		this.decoration = decoration;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Double getGrade() {
		return grade;
	}
	public void setGrade(Double grade) {
		this.grade = grade;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Picture> getPicList() {
		return picList;
	}
	public void setPicList(List<Picture> picList) {
		this.picList = picList;
	}
	public Date getCollect_time() {
		return collect_time;
	}
	public void setCollect_time(Date collect_time) {
		this.collect_time = collect_time;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	
	
}
