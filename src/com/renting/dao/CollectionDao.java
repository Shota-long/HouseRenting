package com.renting.dao;

import java.sql.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.junit.Test;
import com.renting.domain.House;
import com.renting.utils.HibernateUtil;

public class CollectionDao {
	
	public Object findCollection(String house_id,String username) {
		Session session = HibernateUtil.getCurrentSession();
		String hql = "select u.uid,c.collect_id from User u,Collection c where u.uid=c.user_id and u.username=:username and c.house_id=:house_id";
		//session.beginTransaction();
		Query query = session.createQuery(hql);
		query.setParameter("username",username);
		query.setParameter("house_id",house_id);
		Object result = query.uniqueResult();
		return result;
	}
	
	public int addCollection(String collect_id,String house_id, String username) {
		//获取当前系统时间
		Date data = new Date();// new Date()为获取当前系统时间
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String time = df.format(data);
		//System.out.println(time);
		Session session = HibernateUtil.getCurrentSession();
		String sql = "insert into collect_table(user_id,house_id,collect_time,collect_id) select u.user_id,?,?,? from user_table u where u.username=?";
		NativeQuery query = session.createSQLQuery(sql);
		query.setParameter(1, house_id);
		query.setParameter(2, time);
		query.setParameter(3, collect_id);
		query.setParameter(4, username);
		int update = query.executeUpdate();
		return update;
	}
	
	public int deleteCollection(String house_id, String username) {
		Session session = HibernateUtil.getCurrentSession();
		String sql = "DELETE collect_table from user_table,collect_table WHERE user_table.user_id=collect_table.user_id AND user_table.username=? AND collect_table.house_id=?";
		Query query = session.createSQLQuery(sql);
		query.setParameter(1, username);
		query.setParameter(2, house_id);
		int i = query.executeUpdate();
		//System.out.println(i);
		return i;
	}
	@Test
	public List<House> findCollection(String username) {
	
		Session session = HibernateUtil.getCurrentSession();

		String sql = "select c.collect_time,h.* from user_table as u , houseinfo_table as h ,collect_table as c where u.user_id = c.user_id and c.house_id = h.house_id and u.username = ? ";
		NativeQuery query = session.createSQLQuery(sql);
		query.setParameter(1, username);
		List<Object[]> result = query.getResultList();
		List<House> list =new ArrayList<House>();
		for (Object[] object : result) {
			House house = new House();
			//System.out.println(Arrays.toString(object));
			house.setCollect_time((Date) object[0]);
			house.setHouse_id((String) object[1]);
			house.setUser_id((String)object[2]);
			house.setTitle((String)object[3]);
			list.add(house);
				
		}
		//System.out.println(result);
		return list;
	}

}
