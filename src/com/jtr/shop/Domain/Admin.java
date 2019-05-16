package com.jtr.shop.Domain;

import java.util.Date;

/**
 * 管理员类(admin)
 * @author Administrator
 *
 */
public class Admin {
    private Integer id;
    private String admin_name;//管理员名
    private String admin_password;//密码
    private String name;//用户名
    private Date predate;//上一次登录时间
    private String address;//登录地址
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_password() {
		return admin_password;
	}
	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getPredate() {
		return predate;
	}
	public void setPredate(Date predate) {
		this.predate = predate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
    
}
