package com.jtr.shop.Domain;
/**
 * 
 * 商品表
 * @author Administrator
 *
 */
public class goods {
     private String goods_id;//商品编号
     private String goods_name;//商品名称
     private Double goods_price;//价格
     private Integer goods_stock;//库存
     private String goods_image;//图片地址
     private String goods_url;//url
     private String goods_netword;//运行内存
     private Integer band_id;//品牌编号
     private String goods_dist;
     private String goods_cupsize;
     private String goods_color;
     private String goods_pickhead;
     private String goods_os;
     private  String  goods_cupname;
     private String goods_screnn;
     private String goods_power;
     private String goods_height;
     private Integer goods_status;//商品状态1表示热卖品
     private Band band;//所属品牌
     private Integer sale_number;//销售量
     
     
	public Integer getSale_number() {
		return sale_number;
	}
	public void setSale_number(Integer sale_number) {
		this.sale_number = sale_number;
	}
	public Band getBand() {
		return band;
	}
	public void setBand(Band band) {
		this.band = band;
	}
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public Double getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(Double goods_price) {
		this.goods_price = goods_price;
	}
	public Integer getGoods_stock() {
		return goods_stock;
	}
	public void setGoods_stock(Integer goods_stock) {
		this.goods_stock = goods_stock;
	}
	public String getGoods_image() {
		return goods_image;
	}
	public void setGoods_image(String goods_image) {
		this.goods_image = goods_image;
	}
	public String getGoods_url() {
		return goods_url;
	}
	public void setGoods_url(String goods_url) {
		this.goods_url = goods_url;
	}
	public String getGoods_netword() {
		return goods_netword;
	}
	public void setGoods_netword(String goods_netword) {
		this.goods_netword = goods_netword;
	}
	public Integer getBand_id() {
		return band_id;
	}
	public void setBand_id(Integer band_id) {
		this.band_id = band_id;
	}
	public String getGoods_dist() {
		return goods_dist;
	}
	public void setGoods_dist(String goods_dist) {
		this.goods_dist = goods_dist;
	}
	public String getGoods_cupsize() {
		return goods_cupsize;
	}
	public void setGoods_cupsize(String goods_cupsize) {
		this.goods_cupsize = goods_cupsize;
	}
	public String getGoods_color() {
		return goods_color;
	}
	public void setGoods_color(String goods_color) {
		this.goods_color = goods_color;
	}
	
	public String getGoods_pickhead() {
		return goods_pickhead;
	}
	public void setGoods_pickhead(String goods_pickhead) {
		this.goods_pickhead = goods_pickhead;
	}
	public String getGoods_os() {
		return goods_os;
	}
	public void setGoods_os(String goods_os) {
		this.goods_os = goods_os;
	}
	public String getGoods_cupname() {
		return goods_cupname;
	}
	public void setGoods_cupname(String goods_cupname) {
		this.goods_cupname = goods_cupname;
	}
	public String getGoods_screnn() {
		return goods_screnn;
	}
	public void setGoods_screnn(String goods_screnn) {
		this.goods_screnn = goods_screnn;
	}
	public String getGoods_power() {
		return goods_power;
	}
	public void setGoods_power(String goods_power) {
		this.goods_power = goods_power;
	}
	public String getGoods_height() {
		return goods_height;
	}
	public void setGoods_height(String goods_height) {
		this.goods_height = goods_height;
	}
	public Integer getGoods_status() {
		return goods_status;
	}
	public void setGoods_status(Integer goods_status) {
		this.goods_status = goods_status;
	}
     
}
