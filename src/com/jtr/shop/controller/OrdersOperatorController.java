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
 * 管理员中订单系统的操作controller
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
			String bandname=request.getParameter("bandname");//当前的品牌
			Integer pageNum=Integer.parseInt(request.getParameter("page"));//当前页面
			Integer ordertotal=ordersoperatorService.findOrderNumber(bandname);
			pageBean=new pageBean(pageNum,2,ordertotal);
			ordersoperator.setShowbandname(bandname);
			ordersoperator.setPage(pageBean);
			List<ordersoperator> findordersmessage = ordersoperatorService.findordersmessage(ordersoperator);
			pageBean.setShop(findordersmessage);
			List<Band> findBand = bandService.findBand();
			request.setAttribute("band",findBand);
		    request.setAttribute("pageBean",pageBean);
		    request.setAttribute("bandname",bandname);//当前页面所选择的品牌
        	return "ordersoperator.jsp";
        	
        }
        //处理订单
       
        @RequestMapping(value="/handleOrder",method=RequestMethod.POST)
        @ResponseBody
         public  void handleOrder(HttpServletRequest request,HttpServletResponse response) throws IOException {
		   String orderid=request.getParameter("orderid");
		   String goodsid=request.getParameter("goodsid");
		   
		   Integer  goodsnum= Integer.parseInt(request.getParameter("goodsnum"));
		   String sendtype=request.getParameter("sendtype");
		   String send="中通快递";
		   Integer status=Integer.parseInt(request.getParameter("status"));
		   /*<option value="0" select="selected">中通快递</option>
		   <option value="1">圆通快递</option>
		   <option value="2">邮政快递</option>
		   <option value="3">京东快递</option>
		   <option value="4">韵达快递</option>*/
		 switch(sendtype) {
		   case "0": send="中通快递";break;
		   case "1": send="圆通快递";break;
		   case "2": send="邮政快递";break;
		   case "3": send="京东快递";break;
		   case "4": send="韵达快递";break;
		   default: send="中通快递";break;
		   }
		 /*
		  * 
		  * 需要改进，用Aop处理
		  * */
		 orders.setOrder_id(orderid);
		 orders.setOrder_status(status);
		 orders.setSend_type(send);
		 //更新订单信息
		 orderservice.updateorders(orders);
		 //更新商品销售量
		 goodsCustor.setSale_number(goodsnum);
		 goodsCustor.setGoods_id(goodsid);
		 shopService.updateSalenumber(goodsCustor);
		  /* System.out.println("订单id"+orderid);
		   System.out.println("商品id"+goodsid);
           System.out.println("商品的数量"+goodsnum);
           System.out.println(sendtype);
           System.out.println(status);*/
           response.setCharacterEncoding("UTF-8");
           response.setContentType("text/html;charset=UTF-8");
           response.getWriter().print("成功");
        }
        
}
