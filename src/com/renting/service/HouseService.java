package com.renting.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.renting.dao.HouseDao;
import com.renting.domain.House;
import com.renting.utils.HibernateUtil;

public class HouseService {

	public List<House> findHouseInfo() {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		HouseDao house_dao = new HouseDao();
		List<House>resultList =  house_dao.findHouseInfo();
		transaction.commit();
		session.close();
		return resultList;
	}

}
