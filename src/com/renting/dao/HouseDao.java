package com.renting.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.junit.Test;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
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
			//System.out.println(resultList.get(0).getPicList().get(0).getFilePath());
			return resultList;
		}
		else {
			System.out.println("查询失败");
			return null;
		}
		
	}
	
	public int addHouseInfo(String[] split, String house_id) {
		Session session = HibernateUtil.getCurrentSession();
		//Transaction transaction = session.beginTransaction();
		//获取当前系统时间
		Date data = new Date();// new Date()为获取当前系统时间
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String time = df.format(data);
	
		String sql = "insert into houseinfo_table(user_id,title,location,price,deposit_way,rent_way,type,area,decoration,floor,address,description,grade,flag,house_id,date) select u.user_id,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? from user_table u where u.username=?";
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
		query.setParameter(14, house_id);
		query.setParameter(15, time);
		query.setParameter(16, split[11]);
	
		int update = query.executeUpdate();
		//transaction.commit();
		return update;
		
	}

	public List<House> findPublishInfo(String houseOwner, String flag) {
		
		Session session = HibernateUtil.getCurrentSession();
		//session.beginTransaction();
			String hql = "select h from House h , User u where h.user_id = u.uid and u.username=:name AND h.flag =:flag ORDER BY h.date desc";
			Query query = session.createQuery(hql);
			query.setParameter("name", houseOwner);
			query.setParameter("flag", Integer.parseInt(flag));
			List<House> resultList = query.getResultList();
			//System.out.println(resultList.get(0).getHouse_id());
			return resultList;
		
	}
	
	public Object findPublishInfo(String location , String houseOwner , String flag) {
	
		String hql = null;
		Query query;
		Session session = HibernateUtil.getCurrentSession();
		//session.beginTransaction();
		if(location == "" && houseOwner != null) {  //只根据房主查询
			hql = "select h.house_id,h.title,u.uid,u.username,h.date from House h INNER JOIN User u ON h.user_id = u.uid AND u.username = :owner AND h.flag=:flag ORDER BY date desc"; 
			query = session.createQuery(hql);
			query.setParameter("owner", houseOwner);
			query.setParameter("flag", Integer.parseInt(flag));
		}
		else if(location != null && houseOwner == ""){ //只根据区域查询
			hql = "select h.house_id,h.title,u.uid,u.username,h.date from House h INNER JOIN User u ON h.user_id = u.uid AND h.location = :location  AND h.flag=:flag ORDER BY date desc"; 
			query = session.createQuery(hql);
			query.setParameter("location", location);
			query.setParameter("flag", Integer.parseInt(flag));
		}
		else if(location != null && houseOwner != null){  //根据两者查询
			hql = "select h.house_id,h.title,u.uid,u.username,h.date from House h INNER JOIN User u ON h.user_id = u.uid AND u.username = :owner and h.location = :location AND h.flag=:flag ORDER BY date desc";
			query = session.createQuery(hql);
			query.setParameter("owner", houseOwner);
			query.setParameter("location", location);
			query.setParameter("flag", Integer.parseInt(flag));
		}
		else {
			hql = "select h.house_id,h.title,u.uid,u.username,h.date from House h INNER JOIN User u ON h.user_id = u.uid AND h.flag=:flag ORDER BY date desc";
			query = session.createQuery(hql);
			query.setParameter("flag", Integer.parseInt(flag));
		}
		Object resultList = query.getResultList();
		return resultList;
	}
	@Test
	public int updateHouseInfo(String house_id , String flag) {
		
		Session session = HibernateUtil.getCurrentSession();
		//Transaction transaction = session.beginTransaction();
		String hql = "update House h set h.flag = :flag where h.house_id = :house_id";
		Query query = session.createQuery(hql);
		query.setParameter("flag", Integer.parseInt(flag));
		query.setParameter("house_id", house_id);
		int update = query.executeUpdate();
		//transaction.commit();
		System.out.println(update);
		return update;
	}
	
	/*
	 * @Test public void test() {
	 * 
	 * Session session = HibernateUtil.getCurrentSession();
	 * session.beginTransaction(); String sql =
	 * "select * from houseinfo_table h INNER JOIN user_table u ON h.user_id = u.user_id AND u.username = 'John' and h.location = '赤峰市松山区' AND h.flag=1"
	 * ; NativeQuery query = session.createSQLQuery(sql); Object resultList =
	 * query.getResultList(); String json = JSON.toJSONString(resultList);
	 * System.out.println(json); }
	 */
	
	
}
