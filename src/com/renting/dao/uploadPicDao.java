package com.renting.dao;

import java.io.Serializable;

import org.hibernate.Session;

import com.renting.domain.Picture;
import com.renting.utils.HibernateUtil;

public class uploadPicDao {

//	public void uploadPic(Picture picture) {	
//	}
	public void uploadPic(Picture picture) {
		Session session = HibernateUtil.getCurrentSession();
		Serializable save = session.save(picture);
		System.out.println("路径插入数据库："+save);
	}
}
