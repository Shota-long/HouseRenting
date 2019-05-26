package com.renting.dao;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.fastjson.JSON;
import com.renting.domain.RentRecord;
import com.renting.utils.HibernateUtil;

public class RentRecordDao {

	public Serializable insertRecord(String rentId, String houseId, String lessor, String lessee, String startDate, String endDate,
			String flag) throws ParseException {
		
		Session session = HibernateUtil.getCurrentSession();
		String hql1 = "select u.uid from User u where u.username= :name";
		Query query1 = session.createQuery(hql1);
		query1.setParameter("name", "John");
		String lessorId = (String) query1.uniqueResult();
		String hql2 = "select u.uid from User u where u.username= :name";
		Query query2 = session.createQuery(hql2);
		query2.setParameter("name", "lain");
		String lesseeId = (String) query2.uniqueResult();
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		RentRecord rentRecord = (RentRecord) ac.getBean("rentRecord");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		rentRecord.setRentId(rentId);
		rentRecord.setHouseId(houseId);
		rentRecord.setLessorId(lessorId);
		rentRecord.setLesseeId(lesseeId);
		rentRecord.setStartDate(sdf.parse(startDate.toString()));
		rentRecord.setEndDate(sdf.parse(endDate.toString()));
		rentRecord.setFlag(Integer.parseInt(flag));
		Serializable save = session.save(rentRecord);
		return save;
	}
	@Test
	public List<RentRecord> selectRecord(String name) {
	
		Session session = HibernateUtil.getCurrentSession();
		//session.beginTransaction();
		String hql = "select r from RentRecord r , User u where r.lessorId = u.uid and u.username = :name";
		Query query = session.createQuery(hql);
		query.setParameter("name", name);
		List<RentRecord> resultList = query.getResultList();
		for (RentRecord rentRecord : resultList) {
			String hql1 = "select u.username from User u where u.uid = :uid";
			Query query1 = session.createQuery(hql1);
			query1.setParameter("uid", rentRecord.getLesseeId());
			String lesseeName =  (String) query1.uniqueResult();
			rentRecord.setLessor(name);
			rentRecord.setLessee(lesseeName);
//			String json = JSON.toJSONString(rentRecord);
//			System.out.println(json);
		}
		String hql2 = "select r from RentRecord r , User u where r.lesseeId = u.uid and u.username = :name";
		Query query2 = session.createQuery(hql2);
		query2.setParameter("name", name);
		List<RentRecord> resultList2 = query2.getResultList();
		for (RentRecord rentRecord : resultList2) {
			String hql3 = "select u.username from User u where u.uid = :uid";
			Query query3 = session.createQuery(hql3);
			query3.setParameter("uid", rentRecord.getLessorId());
			String lessorName =  (String) query3.uniqueResult();
			rentRecord.setLessor(lessorName);
			rentRecord.setLessee(name);
//			String json = JSON.toJSONString(rentRecord);
//			System.out.println(json);
		}
		resultList.addAll(resultList2);
//		for (RentRecord rentRecord : resultList) {
//			String json = JSON.toJSONString(rentRecord);
//			System.out.println(json);
//		}
		return resultList;
		
	}

}
