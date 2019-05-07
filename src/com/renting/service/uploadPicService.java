package com.renting.service;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

import org.apache.commons.io.FileUtils;

import com.renting.dao.uploadPicDao;
import com.renting.domain.Picture;

public class uploadPicService {

	public void uploadPic( Picture picture) {
		
		File file = picture.getFile();
		String fileFileName = picture.getFileFileName();
		
		String[] getPath = getPath();
		String realPath = getPath[0];
		String savePath = getPath[1];
		System.out.println(realPath);
		System.out.println("savePath"+savePath);
		picture.setFilePath(savePath);		
		System.out.println("fileFileName"+picture.getFileFileName());
		String names[] = fileFileName.split("\\.");
		String fileName = "";
		if(names.length >= 1 ) {
			fileName = UUID.randomUUID()+"."+names[names.length-1];
		}
		if(file != null) {
			//����ͼƬ
			try {
				FileUtils.copyFile(file, new File(new File(realPath),fileName));
				uploadPicDao uploadDao = new uploadPicDao();
				uploadDao.uploadPic(picture);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	//��ȡ�ϴ�·��
	public String[] getPath(){
		String filePath = "D:\\upload\\image";      //ͼƬ�洢ʵ�ʵ�ַ
		String save_filePath = "/upload/image"; //�浽���ݿ�����·��
		File file = new File(filePath);
		if(!file.exists()) {
			file.mkdir();
		}
		Calendar cal = Calendar.getInstance();  //��ȡ��ǰʱ��
		//������Ŀ¼�����ڣ��������Ŀ¼
		int year = cal.get(Calendar.YEAR);
		filePath = filePath+"\\"+year;
		save_filePath = save_filePath+"/"+year;
		file = new File(filePath);
		if(!file.exists()) {
			file.mkdir();
		}
		//����µ�Ŀ¼�����ڣ������µ�Ŀ¼
		int month = cal.get(Calendar.MONTH)+1;
		filePath = filePath+"\\";
		save_filePath = save_filePath+"/";
		if(month<10) {
			filePath = filePath+"0";
			save_filePath = save_filePath +"0";
		}
			
		filePath = filePath + month;
		save_filePath = save_filePath + month;
		file = new File(filePath);
		if(!file.exists()) {
			file.mkdir();
		}
		//����յ�Ŀ¼�����ڣ������յ�Ŀ¼
		int day = cal.get(Calendar.DAY_OF_MONTH);
		filePath = filePath+"\\";
		save_filePath = save_filePath+"/";
		if(day<10) {
			filePath = filePath+"0";
			save_filePath = save_filePath+"0";
		}
		filePath = filePath + day;
		save_filePath = save_filePath + day +"/";
		file = new File(filePath);
		if(!file.exists()) {
			file.mkdir();
		}
		String[] path = new String[2];
		path[0] = filePath;
		path[1] = save_filePath;
		return path;
	}
	
}
