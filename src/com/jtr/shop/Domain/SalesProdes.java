package com.jtr.shop.Domain;
/**
 * 
 * ���۱����࣬�������۱���ͳ�ƣ�admin��
 * @author Administrator
 *
 */
public class SalesProdes {
    private String id;//��Ʒid
    private String name;//��Ʒ����
    private String bandname;//Ʒ������
    private Integer number;//��Ʒ����
    private String showbandname;//���ڲ�Ʒ�����ѯ
    private String desc;//���������ǽ���
    private pageBean page;//ҳ����
	public pageBean getPage() {
		return page;
	}
	public void setPage(pageBean page) {
		this.page = page;
	}
	public String getShowbandname() {
		return showbandname;
	}
	public void setShowbandname(String showbandname) {
		this.showbandname = showbandname;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBandname() {
		return bandname;
	}
	public void setBandname(String bandname) {
		this.bandname = bandname;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
    
    
}
