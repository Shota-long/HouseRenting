package com.renting.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.renting.dao.BrowseDao;
import com.renting.domain.BrowseRecord;
import com.renting.utils.HibernateUtil;

public class BrowseService {

	public void browseRecord(String username, String houseId) throws ParseException {
		
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		BrowseDao dao = new BrowseDao();
		BrowseRecord record = dao.select(username,houseId);
		//获取当前系统时间
		Date data = new Date();// new Date()为获取当前系统时间
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String time = df.format(data);
		//UUID
		String browseId = UUID.randomUUID().toString();
		if(record!=null) {
			System.out.println("浏览记录id="+record.getBrowseId());
			int update = dao.update(record.getBrowseId(),time);
			if(update==1) {
				System.out.println("更新成功");
				transaction.commit();
			}
			else {
				System.out.println("更新失败");
				transaction.rollback();
			}
		}
		else {
			System.out.println("browseId="+browseId+"username="+username+"houseId="+houseId+"time="+time);
			int insert = dao.insert(browseId,username,houseId,time);
			if(insert==1) {
				System.out.println("插入成功");
				transaction.commit();
			}
			else {
				System.out.println("插入失败");
				transaction.rollback();
			}
		}
		
		session.close();
		
	}

	public Object selectRecord(String username) {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		BrowseDao dao = new BrowseDao();
		Object record = dao.selectRecord(username);
		return record;
	
		
	}

}
