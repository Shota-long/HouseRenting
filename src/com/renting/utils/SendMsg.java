package com.renting.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.opensymphony.xwork2.ActionSupport;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import org.apache.struts2.ServletActionContext;

/*
pom.xml
<dependency>
  <groupId>com.aliyun</groupId>
  <artifactId>aliyun-java-sdk-core</artifactId>
  <version>4.0.3</version>
</dependency>
*/
public class SendMsg extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// TODO 此处需要替换成开发者自己的AK(在阿里云访问控制台寻找)
	static final String accessKeyId = "LTAIp8z1Jvtj4Uto"; // TODO 改这里
	static final String accessKeySecret = "zmgPgIml6GgK3I99pl5ev3RWoeicO4"; // TODO 改这里

	// 发送验证码
	public void sendNotice() throws IOException {
		String mobile = ServletActionContext.getRequest().getParameter("mobile");
		System.out.println("发送验证码");
		
		 DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou",accessKeyId, accessKeySecret); 
		 IAcsClient client = new DefaultAcsClient(profile); 
		 //生成验证码 
		 String str="0123456789";
	     String code=new String(); 
		 for(int i=0;i<4;i++) { 
			 char ch=str.charAt(new Random().nextInt(str.length())); 
			 code+=ch; 
		}
		 
		 CommonRequest request = new CommonRequest();
		 //request.setProtocol(ProtocolType.HTTPS);
		 request.setMethod(MethodType.POST);
		 request.setDomain("dysmsapi.aliyuncs.com");
		 request.setVersion("2017-05-25");
		 request.setAction("SendSms"); 
		 request.putQueryParameter("RegionId","cn-hangzhou"); 
		 request.putQueryParameter("PhoneNumbers", mobile);
		 request.putQueryParameter("SignName", "房屋租赁系统");
		 request.putQueryParameter("TemplateCode", "SMS_166777233");
		 request.putQueryParameter("TemplateParam", "{\"code\":\""+code+"\"}"); 
		 try {
			 CommonResponse response = client.getCommonResponse(request);
			 System.out.println(response.getData()); 
		 } catch (ServerException e) {
			 e.printStackTrace(); 
		 } catch (ClientException e) { 
			 e.printStackTrace();
		 }
		ServletActionContext.getRequest().getSession().setAttribute("code", code);
		String json = JSON.toJSONString(code, SerializerFeature.DisableCircularReferenceDetect); // 将JSON对象转化为JSON字符																				// ,关闭循环检测
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		writer.write(json);
		writer.flush();
		writer.close();
	}

	/*
	 * public static void main(String[] args) { String mobile = "18278380801";
	 * sendNotice(mobile); }
	 */
}