package com.jtr.shop.Domain;

import java.util.List;

/**
 * �û���
 * @author �����
 *
 */
public class User {
   private int user_id;//�û����
   private String user_name;//�û�����
   private String user_password;//�û�����
   private String user_email;//email
   private String name;//����
   private String sex;//�Ա�
   private String user_phone;//�绰����
   private String user_address;
   private List<Address>address;//�ջ�����Ϣ
  
   
   
   

	
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
