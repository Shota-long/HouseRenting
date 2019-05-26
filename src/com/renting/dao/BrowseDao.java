package com.renting.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.junit.Test;

import com.alibaba.fastjson.JSON;
import com.renting.domain.BrowseRecord;
import com.renting.utils.HibernateUtil;

public class BrowseDao {
	
	Session session = HibernateUtil.getCurrentSession();
	
	public BrowseRecord select(String username , String houseId) {
		
		//session.beginTransaction();
		String hql = "select b from BrowseRecord b , User u where b.visitorId = u.uid and b.houseId = :house and u.username = :name";
		Query query = session.createQuery(hql);
		query.setParameter("house", houseId);
		query.setParameter("name", username);
		BrowseRecord result = (BrowseRecord) query.uniqueResult();
		return result;
	}

	public int update(String browseId,String time) throws ParseException {
		//session.beginTransaction();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String hql = "update BrowseRecord b set b.browseTime = :time where b.browseId = :id ";
		Query query = session.createQuery(hql);
		query.setParameter("time",df.parse(time));
		query.setParameter("id", browseId);
		int update = query.executeUpdate();
		return update;
		
	}

	public int insert(String browseId, String username, String houseId, String time) {
		
		String sql = "insert into browse_table(browse_id,visitor_id,house_id,browse_time,flag) select ?,u.user_id,?,?,? from user_table u where u.username=?";
		NativeQuery query = session.createSQLQuery(sql);
		query.setParameter(1, browseId);
		query.setParameter(2, houseId);
		query.setParameter(3, time);
		query.setParameter(4, 0);
		query.setParameter(5, username);
		int insert = query.executeUpdate();
		return insert;
	
	}
	@Test
	public Object selectRecord(String username) {
		
		//session.beginTransaction();
		String sql = "select h.title,b.* from browse_table as b, houseinfo_table as h ,user_table as u where u.user_id = b.visitor_id and b.house_id = h.house_id and u.username = ? ORDER BY b.browse_time desc ";
		NativeQuery query = session.createSQLQuery(sql);
		query.setParameter(1, username);
		Object resultList = query.getResultList();
		return resultList;
	}

}
