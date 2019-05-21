package com.renting.service;

import java.util.List;
import java.util.UUID;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.renting.dao.CollectionDao;
import com.renting.domain.Collection;
import com.renting.domain.House;
import com.renting.utils.HibernateUtil;

public class CollectionService {

	public boolean findCollection(String house_id, String username) {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		//创建建立一个DetachedCriteria对象，将查询的条件等指定好
		CollectionDao collectDao = new CollectionDao();
		Object object = collectDao.findCollection(house_id,username);
		if(object!=null) {
			System.out.println("已收藏");
			transaction.commit();
			return true;
		}
		else {
			System.out.println("没收藏");
			transaction.rollback();
		}
		session.close();
		return false;
	}

	public boolean addCollection(String house_id, String username) {
		Session session = HibernateUtil.getCurrentSession();//获取session
		Transaction transaction = session.beginTransaction();//开启事务
		//创建建立一个DetachedCriteria对象，将查询的条件等指定好
		CollectionDao collectDao = new CollectionDao();
		String collect_id = UUID.randomUUID().toString();
		int object = collectDao.addCollection(collect_id,house_id,username);
		if(object == 1) {
			System.out.println("添加收藏成功");
			transaction.commit();
			return true;
		}
		else {
			System.out.println("添加收藏失败");
			transaction.rollback();
		}
		session.close();
		return false;
	}

	public boolean deleteCollection(String house_id, String username) {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		//创建建立一个DetachedCriteria对象，将查询的条件等指定好
		CollectionDao collectDao = new CollectionDao();
		int result = collectDao.deleteCollection(house_id,username);
		if(result == 1) {
			System.out.println("删除成功");
			transaction.commit();
			return true;
		}
		else {
			System.out.println("删除失败");
			transaction.rollback();
		}
		session.close();
		return false;
	}

	public List<House> findCollection(String username) {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		CollectionDao collectDao = new CollectionDao();
		List<House> result = collectDao.findCollection(username);
		if(result.size() != 0) {
			transaction.commit();
			session.close();
			return result;
		}
		else {
			transaction.rollback();
			session.close();
			return null;
		}
		
	}

}
