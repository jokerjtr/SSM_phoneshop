package com.jtr.shop.Domain;

import java.util.List;

/**
 * 
 * 
 * @author �����
 *  ��ҳ�࣬���ڷ���
 */
public class pageBean<T> {
          private Integer pageNum;//��ǰҳ��
          private Integer pageSize;//��ÿһҳ����Ʒ����Ŀ
          private Integer totalShop;//�ܵ���Ʒ����
          private Integer totalPage;//��ҳ��
          private Integer statrIndex;//��ʼ����
          private List<T>shop;//ÿҳ���ݷŵ�������
          private Integer start;//��ʼ��ҳ����
          private Integer end;//����ҳ����
          public pageBean(Integer pageNum,Integer pageSize, Integer totalShop)
          {
        	  this.pageNum=pageNum;this.pageSize=pageSize;this.totalShop=totalShop;
        	  //������ҳ��,��������������1
        	  if(totalShop%pageSize==0) {
        		  this.totalPage=totalShop/pageSize;
        	  }else this.totalPage=totalShop/pageSize+1;
        	  this.start=1;
        	  this.end=5;
        	  
        	//��ʼ����
             this.statrIndex = (pageNum-1)*pageSize ;
             //�����ҳ��С��5�������ʾ��ҳ��ҳΪtotalPage
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
