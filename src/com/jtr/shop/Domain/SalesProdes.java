package com.jtr.shop.Domain;
/**
 * 
 * 销售报表类，用于销售报表统计（admin）
 * @author Administrator
 *
 */
public class SalesProdes {
    private String id;//产品id
    private String name;//产品名字
    private String bandname;//品牌名字
    private Integer number;//产品总数
    private String showbandname;//用于产品分类查询
    private String desc;//用于升序还是降序
    private pageBean page;//页面类
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
