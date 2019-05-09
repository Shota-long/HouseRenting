package com.renting.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.query.Query;

import com.renting.domain.House;
import com.renting.domain.Picture;
import com.renting.domain.User;
import com.renting.utils.HibernateUtil;

public class HouseDao {
	/*
	public List<House> findHouseInfo(String location) {
		Session session = HibernateUtil.getCurrentSession();
		if(location != null) {
			String replace = location.replace("-", "");
			System.out.println("地点："+replace);
			String hql = "from House house where house.location=:locat order by grade desc";
			Query query = session.createQuery(hql);
			query.setParameter("locat",replace);
			List<House> resultList = query.list();
			if(resultList.size() >0) {
//				System.out.println("查询成功");
				for(House list : resultList) {
					//查询用户名
					String hql_1 = "select user.username from User user where user.uid = :uid"; 
					Query query_1 = session.createQuery(hql_1);
					query_1.setParameter("uid", list.getUser_id());
					String result = (String) query_1.uniqueResult();
					//查询picList
					String hql_2 = "from Picture picture where picture.house_id = :house_id"; 
					Query query_2 = session.createQuery(hql_2);
					query_2.setParameter("house_id", list.getHouse_id());
					List<Picture> picListResult = query_2.getResultList();
					list.setUsername(result);
					list.setPicList(picListResult);
				}
				System.out.println(resultList.get(0).getPicList().get(0).getFilePath());
				return resultList;
			}
			else {
				System.out.println("查询失败");
				return null;
			}
			
		}
		else {
			String hql = "from com.renting.domain.House order by grade desc";
			Query query = session.createQuery(hql);
			List<House> resultList = query.getResultList();
			if(resultList.size() >0) {
//				System.out.println("查询成功");
				for(House list : resultList) {
					String hql_1 = "select user.username from User user where user.uid = :uid"; 
					Query query_1 = session.createQuery(hql_1);
					query_1.setParameter("uid", list.getUser_id());
					String result = (String) query_1.uniqueResult();
					//查询picList
					String hql_2 = "from Picture picture where picture.house_id = :house_id"; 
					Query query_2 = session.createQuery(hql_2);
					query_2.setParameter("house_id", list.getHouse_id());
					List<Picture> picListResult = query_2.getResultList();
					list.setUsername(result);
					list.setPicList(picListResult);
				}
				System.out.println(resultList.get(0).getPicList().get(0).getFilePath());
				return resultList;
			}
			else {
				System.out.println("查询失败");
				return null;
			}
		}
	}
*/
	public List<House> findHouseInfo(DetachedCriteria dc) {
		Session session = HibernateUtil.getCurrentSession();//获取session
		Criteria c = dc.getExecutableCriteria(session);
		List<House> resultList = c.list();
		if(resultList.size() >0) {
//			System.out.println("查询成功");
			for(House list : resultList) {
				String hql_1 = "from User user where user.uid = :uid"; 
				Query query_1 = session.createQuery(hql_1);
				query_1.setParameter("uid", list.getUser_id());
				User user = (User) query_1.uniqueResult();
				//查询picList
				String hql_2 = "from Picture picture where picture.house_id = :house_id"; 
				Query query_2 = session.createQuery(hql_2);
				query_2.setParameter("house_id", list.getHouse_id());
				List<Picture> picListResult = query_2.getResultList();
				list.setUser(user);
				list.setPicList(picListResult);
			}
			System.out.println(resultList.get(0).getPicList().get(0).getFilePath());
			return resultList;
		}
		else {
			System.out.println("查询失败");
			return null;
		}
		
	}
	
}
