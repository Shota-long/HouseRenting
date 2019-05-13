package com.renting.dao;

import com.renting.domain.Picture;

public class uploadPicDao {

	public void uploadPic(Picture picture) {
		
		System.out.println("正在查询");
		System.out.println("插入数据库的fileName:"+picture.getFileFileName());
		
	}

}
