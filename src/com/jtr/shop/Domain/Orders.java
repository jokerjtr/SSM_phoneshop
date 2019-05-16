package com.jtr.shop.Domain;

import java.util.Date;

/**
 * 
 * ¶©µ¥±í
 * @author Administrator
 *
 */
public class Orders {
      private String order_id;
      private  String goods_id;
      private Integer user_id;
      private Integer goods_number;
      private Double Goods_money;
      private Double Goods_total_money;
      private Integer addr_id;
      private  String pay_type;
      private String send_type;
      private Integer order_status;
      private Date order_time;
      private String remark;
      
      public String getPay_type() {
		return pay_type;
	}
	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}
	public Date getOrder_time() {
		return order_time;
	}
	public void setOrder_time(Date order_time) {
		this.order_time = order_time;
	}
	
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Integer getGoods_number() {
		return goods_number;
	}
	public void setGoods_number(Integer goods_number) {
		this.goods_number = goods_number;
	}
	public Double getGoods_money() {
		return Goods_money;
	}
	public void setGoods_money(Double goods_money) {
		Goods_money = goods_money;
	}
	
	public Double getGoods_total_money() {
		return Goods_total_money;
	}
	public void setGoods_total_money(Double goods_total_money) {
		Goods_total_money = goods_total_money;
	}
	public Integer getAddr_id() {
		return addr_id;
	}
	public void setAddr_id(Integer addr_id) {
		this.addr_id = addr_id;
	}

	public String getSend_type() {
		return send_type;
	}
	public void setSend_type(String send_type) {
		this.send_type = send_type;
	}
	public Integer getOrder_status() {
		return order_status;
	}
	public void setOrder_status(Integer order_status) {
		this.order_status = order_status;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
      
}
