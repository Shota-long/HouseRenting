package com.renting.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.renting.domain.House;
import com.renting.utils.HibernateUtil;

public class HouseDao {

	public List<House> findHouseInfo() {
		Session session = HibernateUtil.getCurrentSession();
		String hql = "from com.renting.domain.House order by house_grade desc";
		Query<House> query = session.createQuery(hql);
		List<House> resultList = query.getResultList();
		return resultList;
	}
	
}
