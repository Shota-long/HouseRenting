package com.renting.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.junit.Test;

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
	@Test
	public void addHouseInfo(String[] split) {
		Session session = HibernateUtil.getCurrentSession();
		//Transaction transaction = session.beginTransaction();
		String sql = "insert into houseinfo_table(user_id,title,location,price,deposit_way,rent_way,type,area,decoration,floor,address,description,grade,flag) select u.user_id,?,?,?,?,?,?,?,?,?,?,?,?,? from user_table u where u.username=?";
		NativeQuery query = session.createSQLQuery(sql);
		
		query.setParameter(1, split[0]);
		query.setParameter(2, split[8]);
		query.setParameter(3, Integer.parseInt(split[1]));
		query.setParameter(4, split[2]);
		query.setParameter(5, split[3]);
		query.setParameter(6, split[4]);
		query.setParameter(7, Integer.parseInt(split[5]));
		query.setParameter(8, split[6]);
		query.setParameter(9, Integer.parseInt(split[7]));
		query.setParameter(10, split[9]);
		query.setParameter(11, split[10]);
		query.setParameter(12, 10);
		query.setParameter(13, 0);
		query.setParameter(14, split[11]);
	
		int update = query.executeUpdate();
		//transaction.commit();
		System.out.println(update);
		//return update;
		if(update==1) {
			System.out.println("插入成功");
		}
		else {
			System.out.println("插入失败");
		}
	}
	
	
}
