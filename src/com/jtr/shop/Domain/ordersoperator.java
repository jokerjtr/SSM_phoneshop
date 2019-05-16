package com.jtr.shop.Domain;
/**
 * 订单操作类(admin)
 * @author Administrator
 *
 */
public class ordersoperator {
	private String orderid;// 订单编号
	private String goodsid;// 商品编号
	private String goodsname;// 商品名称
	private String bandname;// 产品名称
	private String remark;// 商品描述
	private Integer goodsnumber;// 商品数量
	private Integer goodsstock;// 商品库存
	private Double goodsprice;// 商品单价
	private String paytype;// 支付方式
	private String address;// 收获地址
	private String sendtype;// 送货方式
	private Integer orderstatus;// 0表示提交,为审核，1表示审核通过,2表示审核不通过，3表示订单以查收
	private String showbandname;// 查询的品牌
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
