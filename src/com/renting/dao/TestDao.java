package com.renting.dao;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.junit.Test;

import com.renting.domain.User;
import com.renting.utils.HibernateUtil;

public class TestDao {
	@Test
	public void test() {
		Session session = HibernateUtil.getSession();
		String hql = "from com.renting.domain.User where username = :username and password = :password";
		Query query = session.createQuery(hql);
		query.setParameter("username" , "John");
		query.setParameter("password" , "123");
		User result = (User) query.uniqueResult();
		if(result != null) {
			System.out.println("查询成功");
		}
		else {
			System.out.println("查询失败");
		}
		
	}
}
