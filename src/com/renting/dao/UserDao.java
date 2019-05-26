package com.renting.dao;

import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.junit.Test;

import com.renting.domain.User;
import com.renting.utils.HibernateUtil;


public class UserDao {

	public User findUser(User user) {
		
		Session session = HibernateUtil.getCurrentSession();//获取session
		String hql = "from com.renting.domain.User where username = :username and password = :password";
		Query query = session.createQuery(hql);
		query.setParameter("username", user.getUsername());
		query.setParameter("password", user.getPassword());
		User result = (User) query.uniqueResult();
		return result;
	}

	public Serializable addUser(User user) {
		Session session = HibernateUtil.getCurrentSession();//获取session
		Serializable save = session.save(user);
		return save;
	}

	public User verifUsername(String name) {
		
		Session session = HibernateUtil.getCurrentSession();//获取session
		String hql = "from com.renting.domain.User where username = :username";
		Query query = session.createQuery(hql);
		query.setParameter("username", name);
		User result = (User) query.uniqueResult();
		return result;
	}

	public int updatePwd(String username, String password) {
		
		Session session = HibernateUtil.getCurrentSession();//获取session
		String hql = "update User u set u.password = :pwd  where username = :username";
		Query query = session.createQuery(hql);
		query.setParameter("pwd", password);
		query.setParameter("username", username);
		int update = query.executeUpdate();
		return update;
	}

	

}
