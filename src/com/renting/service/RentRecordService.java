package com.renting.service;

import java.io.Serializable;
import java.text.ParseException;
import java.util.List;
import java.util.UUID;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.renting.dao.RentRecordDao;
import com.renting.domain.RentRecord;
import com.renting.utils.HibernateUtil;

public class RentRecordService {

	public int insertRecord(String houseId, String lessor, String lessee, String startDate, String endDate,String flag) throws ParseException {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		RentRecordDao dao = new RentRecordDao();
		String rentId = UUID.randomUUID().toString();
		Serializable update = dao.insertRecord( rentId, houseId, lessor, lessee, startDate, endDate, flag);
		if(update != null ) {
			System.out.println("插入成功");
			transaction.commit();
			session.close();
			HouseService h_service = new HouseService();
			int updateHouseInfo = h_service.updateHouseInfo(houseId, "2"); //更新租房标志位为2
			if(updateHouseInfo==1)
				return 1;
			else
				return 0;
		}
		else {
			System.out.println("插入失败");
			transaction.rollback();
			session.close();
			return 0;
		}
		
		
	}

	public List<RentRecord> selectRecord(String name) {
		
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		RentRecordDao dao = new RentRecordDao();
		List<RentRecord> list = dao.selectRecord(name);
		return list;
	}
	
}
