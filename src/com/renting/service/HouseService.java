package com.renting.service;

import java.util.List;
import java.util.UUID;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.renting.dao.HouseDao;
import com.renting.domain.House;
import com.renting.domain.Picture;
import com.renting.utils.HibernateUtil;
import com.renting.web.uploadPicAction;

public class HouseService {

	public List<House> findHouseInfo(String house_id,String location, String minprice1,String maxprice1, String type, String rent_way, String decoration,String flag) {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		//创建建立一个DetachedCriteria对象，将查询的条件等指定好
		DetachedCriteria dc = DetachedCriteria.forClass(House.class);
		
		if(house_id != null && house_id != "") {
			dc.add(Restrictions.eq("house_id", house_id));
		}
		
		if(location != null && location != "") {
			String replace = location.replace("-", "");
			dc.add(Restrictions.eq("location", replace));
		}
		
		if(minprice1 != null && minprice1 != "") {
			int minprice = Integer.parseInt(minprice1);
			int maxprice = Integer.parseInt(maxprice1);
			if(minprice == 4500)
				dc.add(Restrictions.ge("price", minprice));//价格大于等于4500
			else if(maxprice==499){
				dc.add(Restrictions.le("price", maxprice));//价格小于500
			}
			else
				dc.add(Restrictions.between("price", minprice, maxprice));
		}
		
		if(type != null && type != "") {
			dc.add(Restrictions.like("type", type+"%"));
		}
		
		if(rent_way != null && rent_way != "") {
			dc.add(Restrictions.eq("rent_way", rent_way));
		}
		
		if(decoration != null && decoration != "") {
			dc.add(Restrictions.eq("decoration", decoration));
		}
		if(flag != null && flag != "") {
			int FLG = Integer.parseInt(flag);
			if(FLG == 0 ) {
				//System.out.println("flag="+flag);
				dc.add(Restrictions.eq("flag", 0));
			}
			else if(FLG == 1 ) {
				//System.out.println("flag="+flag);
				dc.add(Restrictions.eq("flag", 1));
			}
			else if(FLG == 2 ) {
				//System.out.println("flag="+flag);
				dc.add(Restrictions.eq("flag", 2));
			}
		}
		
		dc.addOrder(Order.desc("grade"));
		//注入持久层
		HouseDao house_dao = new HouseDao();
		//List<House>resultList =  house_dao.findHouseInfo(location);
		List<House> resultList = house_dao.findHouseInfo(dc);
		transaction.commit();
		session.close();
		return resultList;
	}

	public void addHouseInfo(Picture picture, String[] split) {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		HouseDao house_dao = new HouseDao();
		String house_id = UUID.randomUUID().toString();
		int info = house_dao.addHouseInfo(split,house_id);
		if(info==1) {
			System.out.println("插入成功");
			transaction.commit();
			uploadPicAction picAction = new uploadPicAction();
			picAction.uploadPic(house_id,picture);
			session.close();
		}
		else {
			System.out.println("插入失败");
			transaction.rollback();;
			session.close();
		}
	}

	public List<House> findPublishInfo(String houseOwner, String flag) {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		HouseDao house_dao = new HouseDao();
		List<House> resultList =  house_dao.findPublishInfo(houseOwner,flag);
		transaction.commit();
		session.close();
		return resultList;
	}
}
