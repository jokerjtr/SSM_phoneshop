package com.jtr.shop.Domain;
/**
 * ����������(admin)
 * @author Administrator
 *
 */
public class ordersoperator {
	private String orderid;// �������
	private String goodsid;// ��Ʒ���
	private String goodsname;// ��Ʒ����
	private String bandname;// ��Ʒ����
	private String remark;// ��Ʒ����
	private Integer goodsnumber;// ��Ʒ����
	private Integer goodsstock;// ��Ʒ���
	private Double goodsprice;// ��Ʒ����
	private String paytype;// ֧����ʽ
	private String address;// �ջ��ַ
	private String sendtype;// �ͻ���ʽ
	private Integer orderstatus;// 0��ʾ�ύ,Ϊ��ˣ�1��ʾ���ͨ��,2��ʾ��˲�ͨ����3��ʾ�����Բ���
	private String showbandname;// ��ѯ��Ʒ��
	private pageBean page;//

	public String getShowbandname() {
		return showbandname;
	}

	public void setShowbandname(String showbandname) {
		this.showbandname = showbandname;
	}

	public pageBean getPage() {
		return page;
	}

	public void setPage(pageBean page) {
		this.page = page;
	}

	
	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getGoodsid() {
		return goodsid;
	}

	public void setGoodsid(String goodsid) {
		this.goodsid = goodsid;
	}

	public String getGoodsname() {
		return goodsname;
	}

	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}

	public String getBandname() {
		return bandname;
	}

	public void setBandname(String bandname) {
		this.bandname = bandname;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getGoodsnumber() {
		return goodsnumber;
	}

	public void setGoodsnumber(Integer goodsnumber) {
		this.goodsnumber = goodsnumber;
	}

	public Integer getGoodsstock() {
		return goodsstock;
	}

	public void setGoodsstock(Integer goodsstock) {
		this.goodsstock = goodsstock;
	}

	public Double getGoodsprice() {
		return goodsprice;
	}

	public void setGoodsprice(Double goodsprice) {
		this.goodsprice = goodsprice;
	}

	public String getPaytype() {
		return paytype;
	}

	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSendtype() {
		return sendtype;
	}

	public void setSendtype(String sendtype) {
		this.sendtype = sendtype;
	}

	public Integer getOrderstatus() {
		return orderstatus;
	}

	public void setOrderstatus(Integer orderstatus) {
		this.orderstatus = orderstatus;
	}
   
   
}
