package com.renting.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import com.alibaba.fastjson.JSONObject;

public class Test{
	public String[] getCoordinate(String addr) throws IOException { 
		String lng = null;//经度
		String lat = null;//纬度
		String address = null; 
		try { 
			address = java.net.URLEncoder.encode(addr, "UTF-8"); 
		}catch (UnsupportedEncodingException e1) { 
			e1.printStackTrace(); 
		} 
		//System.out.println(address);
		String url = "http://api.map.baidu.com/geocoder/v2/?output=json&ak=693bdK8566ezLSAGGRwpGMmYVACB0eG5&address="+address;
		URL myURL = null; 
 
		URLConnection httpsConn = null; 
		try {
			myURL = new URL(url); 
		} catch (MalformedURLException e) { 
			e.printStackTrace(); 
		} 
		InputStreamReader insr = null;
		BufferedReader br = null;
		try { 
			httpsConn = (URLConnection) myURL.openConnection();
			if (httpsConn != null) { 
				insr = new InputStreamReader( httpsConn.getInputStream(), "UTF-8"); 
				br = new BufferedReader(insr); 
				String data = null; 
				while((data= br.readLine())!=null){ 
					JSONObject json = JSONObject.parseObject(data);
					System.out.println("json="+json);
					lng = json.getJSONObject("result").getJSONObject("location").getString("lng");
					lat = json.getJSONObject("result").getJSONObject("location").getString("lat");
				}
			} 
		} catch (IOException e) { 
			e.printStackTrace(); 
		} finally {
			if(insr!=null){
				insr.close();
			}
			if(br!=null){
				br.close();
			}
		}
		return new String[]{lng,lat}; 
	}
	
	public static void main(String[] args) throws IOException {
		Test getLatAndLngByBaidu = new Test();
		String[] o = getLatAndLngByBaidu.getCoordinate("桂林市雁山区雁山镇医院");
		System.out.println(o[0]);
		System.out.println(o[1]);
	}
}