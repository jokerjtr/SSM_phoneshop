package com.jtr.shop.Domain;

import java.util.List;

/**
 * 
 * 
 * @author 李惠智
 *  分页类，用于分类
 */
public class pageBean<T> {
          private Integer pageNum;//当前页面
          private Integer pageSize;//当每一页面商品的数目
          private Integer totalShop;//总的商品总数
          private Integer totalPage;//总页数
          private Integer statrIndex;//开始索引
          private List<T>shop;//每页内容放到集合总
          private Integer start;//开始的页面数
          private Integer end;//结束页面数
          public pageBean(Integer pageNum,Integer pageSize, Integer totalShop)
          {
        	  this.pageNum=pageNum;this.pageSize=pageSize;this.totalShop=totalShop;
        	  //计算总页数,如果不能整除则加1
        	  if(totalShop%pageSize==0) {
        		  this.totalPage=totalShop/pageSize;
        	  }else this.totalPage=totalShop/pageSize+1;
        	  this.start=1;
        	  this.end=5;
        	  
        	//开始索引
             this.statrIndex = (pageNum-1)*pageSize ;
             //如果总页数小于5则最后显示的页数页为totalPage
             if(this.totalPage<5) {
            	 this.end=this.totalPage; 
             }else {
            	 this.start=pageNum-1;
            	 this.end=pageNum+1;
             }
             if(this.start<0) {
            	 this.start=1;
            	 this.end=5;
             }
             if(this.end>this.totalPage) {
            	 this.end=this.totalPage;
            	 this.start=this.end-5;
             }
            
          }
		public Integer getPageNum() {
			return pageNum;
		}
		public void setPageNum(Integer pageNum) {
			this.pageNum = pageNum;
		}
		public Integer getPageSize() {
			return pageSize;
		}
		public void setPageSize(Integer pageSize) {
			this.pageSize = pageSize;
		}
		public Integer getTotalShop() {
			return totalShop;
		}
		public void setTotalShop(Integer totalShop) {
			this.totalShop = totalShop;
		}
		public Integer getTotalPage() {
			return totalPage;
		}
		public void setTotalPage(Integer totalPage) {
			this.totalPage = totalPage;
		}
		public Integer getStatrIndex() {
			return statrIndex;
		}
		public void setStatrIndex(Integer statrIndex) {
			this.statrIndex = statrIndex;
		}
		public List<T> getShop() {
			return shop;
		}
		public void setShop(List<T> shop) {
			this.shop = shop;
		}
		public Integer getStart() {
			return start;
		}
		public void setStart(Integer start) {
			this.start = start;
		}
		public Integer getEnd() {
			return end;
		}
		public void setEnd(Integer end) {
			this.end = end;
		}
          
          
}
