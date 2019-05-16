package com.jtr.shop.Domain;
/**
 * 对商品的扩展
 * 购物车商品
 * @author Administrator
 *
 */
public class goodsCustor extends goods{
   private int goods_number;//商品数量
   private Double goods_total_money;//商品总价格
   private pageBean page;
   private Integer number;
public Integer getNumber() {
	return number;
}
public void setNumber(Integer number) {
	this.number = number;
}
public pageBean getPage() {
	return page;
}
public void setPage(pageBean page) {
	this.page = page;
}
public int getGoods_number() {
	return goods_number;
}
public void setGoods_number(int goods_number) {
	this.goods_number = goods_number;
}
public Double getGoods_total_money() {
	return goods_total_money;
}
public void setGoods_total_money(Double goods_total_money) {
	this.goods_total_money = goods_total_money;
}
   
   
}
