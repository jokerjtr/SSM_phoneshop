package com.jtr.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jtr.shop.Domain.*;
import com.jtr.shop.serviceImp.BandServiceImp;
import com.jtr.shop.serviceImp.OrderServiceImp;
import com.jtr.shop.serviceImp.ShopServiceImp;
import com.jtr.shop.serviceImp.ordersoperatorServiceImp;
/**
 * ����Ա�ж���ϵͳ�Ĳ���controller
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/admin")
public class OrdersOperatorController {
	   @Autowired
	   private ordersoperator ordersoperator;
	   @Autowired
	   private ordersoperatorServiceImp ordersoperatorService;
	   private pageBean pageBean;
	   @Autowired
	   private BandServiceImp bandService;
	   @Autowired
	   private Orders orders;
	   @Autowired
	   private OrderServiceImp orderservice;
	   @Autowired
	   private goodsCustor goodsCustor;
	   @Autowired
	   private ShopServiceImp shopService;
        @RequestMapping("/toOrdersOperator")
        public String toOrdersOperator(HttpServletRequest request,HttpServletResponse response) {
			String bandname=request.getParameter("bandname");//��ǰ��Ʒ��
			Integer pageNum=Integer.parseInt(request.getParameter("page"));//��ǰҳ��
			Integer ordertotal=ordersoperatorService.findOrderNumber(bandname);
			pageBean=new pageBean(pageNum,2,ordertotal);
			ordersoperator.setShowbandname(bandname);
			ordersoperator.setPage(pageBean);
			List<ordersoperator> findordersmessage = ordersoperatorService.findordersmessage(ordersoperator);
			pageBean.setShop(findordersmessage);
			List<Band> findBand = bandService.findBand();
			request.setAttribute("band",findBand);
		    request.setAttribute("pageBean",pageBean);
		    request.setAttribute("bandname",bandname);//��ǰҳ����ѡ���Ʒ��
        	return "ordersoperator.jsp";
        	
        }
        //������
       
        @RequestMapping(value="/handleOrder",method=RequestMethod.POST)
        @ResponseBody
         public  void handleOrder(HttpServletRequest request,HttpServletResponse response) throws IOException {
		   String orderid=request.getParameter("orderid");
		   String goodsid=request.getParameter("goodsid");
		   
		   Integer  goodsnum= Integer.parseInt(request.getParameter("goodsnum"));
		   String sendtype=request.getParameter("sendtype");
		   String send="��ͨ���";
		   Integer status=Integer.parseInt(request.getParameter("status"));
		   /*<option value="0" select="selected">��ͨ���</option>
		   <option value="1">Բͨ���</option>
		   <option value="2">�������</option>
		   <option value="3">�������</option>
		   <option value="4">�ϴ���</option>*/
		 switch(sendtype) {
		   case "0": send="��ͨ���";break;
		   case "1": send="Բͨ���";break;
		   case "2": send="�������";break;
		   case "3": send="�������";break;
		   case "4": send="�ϴ���";break;
		   default: send="��ͨ���";break;
		   }
		 /*
		  * 
		  * ��Ҫ�Ľ�����Aop����
		  * */
		 orders.setOrder_id(orderid);
		 orders.setOrder_status(status);
		 orders.setSend_type(send);
		 //���¶�����Ϣ
		 orderservice.updateorders(orders);
		 //������Ʒ������
		 goodsCustor.setSale_number(goodsnum);
		 goodsCustor.setGoods_id(goodsid);
		 shopService.updateSalenumber(goodsCustor);
		  /* System.out.println("����id"+orderid);
		   System.out.println("��Ʒid"+goodsid);
           System.out.println("��Ʒ������"+goodsnum);
           System.out.println(sendtype);
           System.out.println(status);*/
           response.setCharacterEncoding("UTF-8");
           response.setContentType("text/html;charset=UTF-8");
           response.getWriter().print("�ɹ�");
        }
        
}
