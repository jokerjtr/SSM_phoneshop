package com.jtr.shop.Domain;

import java.util.Date;

/**
 * ����Ա��(admin)
 * @author Administrator
 *
 */
public class Admin {
    private Integer id;
    private String admin_name;//����Ա��
    private String admin_password;//����
    private String name;//�û���
    private Date predate;//��һ�ε�¼ʱ��
    private String address;//��¼��ַ
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
