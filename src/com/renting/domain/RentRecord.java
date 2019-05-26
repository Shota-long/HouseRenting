package com.renting.domain;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class RentRecord {
	
	private String rentId;
	private String houseId;
	private String lessorId;
	private String lessor;
	private String lesseeId;
	private String lessee;
	@JSONField(format="yyyy-MM-dd")
	private Date startDate;
	@JSONField(format="yyyy-MM-dd")
	private Date endDate;
	private int flag;
	public String getRentId() {
		return rentId;
	}
	public void setRentId(String rentId) {
		this.rentId = rentId;
	}
	public String getHouseId() {
		return houseId;
	}
	public void setHouseId(String houseId) {
		this.houseId = houseId;
	}
	public String getLessorId() {
		return lessorId;
	}
	public void setLessorId(String lessorId) {
		this.lessorId = lessorId;
	}
	public String getLesseeId() {
		return lesseeId;
	}
	public void setLesseeId(String lesseeId) {
		this.lesseeId = lesseeId;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public String getLessor() {
		return lessor;
	}
	public void setLessor(String lessor) {
		this.lessor = lessor;
	}
	public String getLessee() {
		return lessee;
	}
	public void setLessee(String lessee) {
		this.lessee = lessee;
	}
	
}
