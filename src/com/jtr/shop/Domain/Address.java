package com.jtr.shop.Domain;
/**
 * 
 * 用户收货地址
 * @author Administrator
 *
 */
public class Address {
	
	private Integer addr_id;
	private String name;
	private String addr_detail;
	private String telphone;
	private Integer user_id;
	public Integer getAddr_id() {
		return addr_id;
	}
	public void setAddr_id(Integer addr_id) {
		this.addr_id = addr_id;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	

}
