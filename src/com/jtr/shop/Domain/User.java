package com.jtr.shop.Domain;

import java.util.List;

/**
 * 用户表
 * @author 李惠智
 *
 */
public class User {
   private int user_id;//用户编号
   private String user_name;//用户姓名
   private String user_password;//用户密码
   private String user_email;//email
   private String name;//姓名
   private String sex;//性别
   private String user_phone;//电话号码
   private String user_address;
   private List<Address>address;//收货人信息
  
   
   
   

	
	public List<Address> getAddress() {
	return address;
}

public void setAddress(List<Address> address) {
	this.address = address;
}


	public int getUser_id() {
		return user_id;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public String getUser_phone() {
	return user_phone;
}
public void setUser_phone(String user_phone) {
	this.user_phone = user_phone;
}
   
   
}
