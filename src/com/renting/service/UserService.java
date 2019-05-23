package com.renting.service;

import java.io.Serializable;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.opensymphony.xwork2.ActionContext;
import com.renting.dao.UserDao;
import com.renting.domain.User;
import com.renting.utils.HibernateUtil;

public class UserService {

	public User findUser(User user) {
		Session session = HibernateUtil.getCurrentSession();//获取session
		Transaction transaction = session.beginTransaction();//开启事务
		UserDao user_dao = new UserDao();
//		user.setUsername("John");
//		user.setPassword("123");
		User temp = user_dao.findUser(user);
		transaction.commit(); //提交事务
		session.close();	//关闭session
		return temp;
	}
	
	public boolean addUser(User user) {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		////////////////////////////
//		User user = new User();
//		user.setUid("2");
//		user.setUsername("lain");
//		user.setPassword("456");
//		user.setTelephone("123");
//		user.setEmail("123");
//		user.setAuthority("2");
		///////////////////////////////
		UserDao user_dao = new UserDao();
		Serializable save = user_dao.addUser(user);
		transaction.commit();
		session.close();
		return save == user.getUid()?true:false;
		
	}

	public Boolean verifUsername(String name) {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		UserDao user_dao = new UserDao();
		User temp = user_dao.verifUsername(name);
		transaction.commit();
		session.close();
		return temp == null? false:true;

	}

	public void removeSession() {
		//清除session
		System.out.println("清空用户名");
		ActionContext.getContext().getSession().remove("login_name");
	}

}
