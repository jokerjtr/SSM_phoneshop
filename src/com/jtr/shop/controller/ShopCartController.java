package com.jtr.shop.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jtr.shop.Domain.User;
import com.jtr.shop.Domain.goods;
import com.jtr.shop.Domain.goodsCustor;
import com.jtr.shop.serviceImp.ShopServiceImp;

@Controller
public class ShopCartController {
    //获取cookie
	  @Autowired
	  private ShopServiceImp shopservice;
	public Cookie getCookie(HttpServletRequest request,HttpServletResponse response)
	{   //获取用户名，以用户名作为COOKIE的名字
		HttpSession session = request.getSession();
	    User user=(User) session.getAttribute("loginUser");
		Cookie cookie[]=request.getCookies();
		Cookie cart_cookie=null;
		for(Cookie cook:cookie)
		{
			if(user.getUser_name().equals(cook.getName())) {
				cart_cookie=cook;
			}
		}
		return cart_cookie;
	}
	//设置Cookie的value值,属性与属性用&隔开，对象用==隔开
	public String makeCookieValue(List<goodsCustor>goods)
	{    StringBuffer buffer_2st = new StringBuffer();
	     
	     for(goodsCustor good:goods)
	     {
	    	 buffer_2st.append( good.getGoods_id()+
	    			            "&"+good.getGoods_name()+
	    			            "&"+good.getGoods_price()+
	    			            "&"+good.getGoods_image()+
	    			            "&"+good.getGoods_netword()+
	    			            "&"+good.getGoods_color()+
	    			            
	                            "&"+good.getGoods_number()+
	                            "&"+good.getGoods_total_money()+"==");
	     }
	     
		return buffer_2st.toString().substring(0,buffer_2st.toString().length());
		
	}
	//获取购物车列表信息
	public List<goodsCustor>getCookieIncookie(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		//创建一个空的商品类表
		List<goodsCustor>items=new ArrayList<goodsCustor>();
		String cookie_val=null;
		Cookie cookie=getCookie(request,response);
		if(cookie!=null)
		{//cookie不为空
			cookie_val=URLDecoder.decode(cookie.getValue(),"utf-8");//获取cookie值
			if(cookie_val!=null&&!"".equals(cookie_val)) {
				String []arr_goods=cookie_val.split("==");//多个对象分割是用==分割
				for(String arr_good:arr_goods)
				{
					 //将属性&分割开
					String []arr_value=arr_good.split("&");
					goodsCustor good=new goodsCustor();
					good.setGoods_id(arr_value[0]);
					good.setGoods_name(arr_value[1]);
					good.setGoods_price(Double.valueOf(arr_value[2]));
					good.setGoods_image(arr_value[3]);
					good.setGoods_netword(arr_value[4]);
					good.setGoods_color(arr_value[5]);
					
					good.setGoods_number(Integer.valueOf(arr_value[6]));
					good.setGoods_total_money(Double.valueOf(arr_value[7]));
					items.add(good);
				}
				
			}
			
		}
		return items;
	}
	//对购物车进行增删查
	//删除
	@RequestMapping("/deleteByGoodsId")
	public void deleteByGoodsId(@RequestParam String id,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		List<goodsCustor>items=null;
		items=getCookieIncookie(request,response);
		goodsCustor deletegoods=null;
		for(goodsCustor c:items) {
			if(c.getGoods_id().equals(id)) {
				deletegoods=c;
				break;
			}
		}
		if(deletegoods!=null) {
			items.remove(deletegoods);
		}
		Cookie cookie=getCookie(request,response);
		cookie.setValue(URLEncoder.encode(makeCookieValue(items),"utf-8"));//cookie不能有空格所要转码
		cookie.setMaxAge(60*60*24*31);
		response.addCookie(cookie);
       //需要修改
	    String url=request.getContextPath();
		/*response.setHeader("refresh","1;/Shop_1.1/getCart.action");*/
	    response.setHeader("refresh","3;"+url+"/getCart.action");
	}
	//清空购物车
	@RequestMapping("/deleteAllcookie")
	public void deleteAllcookie(HttpServletRequest request,HttpServletResponse response)
	{
		Cookie cookie=getCookie(request,response);
		cookie.setValue(null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		String url=request.getContextPath();
		response.setHeader("refresh","1;"+url+"/getCart.action");
	}
	//获得购物列表信息
	@RequestMapping("/getCart")
	public String getCart(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		List<goodsCustor>goods=null;
		goods=getCookieIncookie(request,response);
		request.setAttribute("goods",goods);
		return "ShopCat.jsp";
	}
	//增加购物车
	@RequestMapping("/addCart")
	public void addCart(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		List<goodsCustor> cookieIncookie = getCookieIncookie(request,response);
		goodsCustor item=new goodsCustor();
		Cookie cookie=getCookie(request,response);
		 String goods_image=request.getParameter("goods_image"); 
		 String goods_name=request.getParameter("goods_name");
	     String goods_color=request.getParameter("goods_color");
	     String goods_ram=request.getParameter("goods_ram");
	     Double goods_price=Double.valueOf(request.getParameter("money"));
	     String goodsnumber=request.getParameter("goods_number");
		Integer goods_number=Integer.parseInt(goodsnumber);
		item.setGoods_image(goods_image);
		item.setGoods_name(goods_name);
		item.setGoods_color(goods_color);
		item.setGoods_netword(goods_ram);
		item.setGoods_price(goods_price);
		item.setGoods_number(goods_number);
		String goods_id=shopservice.findBygoodsnameAndRamAndColor(item);
		item.setGoods_id(goods_id);
		item.setGoods_total_money(goods_number*goods_price);
		if(cookieIncookie.size()<=0) {
			 cookieIncookie.add(item);
			//表示没有重来没有创建这个cookie
			if(cookie==null) {
				HttpSession session = request.getSession();
			    User user=(User) session.getAttribute("loginUser");
				cookie=new Cookie(user.getUser_name(),URLEncoder.encode(makeCookieValue(cookieIncookie), "UTF-8"));
				cookie.setMaxAge(60*60*24*31);
				request.setAttribute("addcat","成功加入购物车");
				response.addCookie(cookie);
			}
			else {
				//这个COOKie存在，但value列表为空
				cookie.setMaxAge(60*60*24*31);
				cookie.setValue(URLEncoder.encode(makeCookieValue(cookieIncookie), "UTF-8"));
				request.setAttribute("addcat","成功加入购物车");
				response.addCookie(cookie);
			}	
		}//当列表不为空
		else {
			boolean isexit=false;//判断列表中是否以存在、
			int i=0;
			for(goodsCustor good:cookieIncookie) {
				 int j=i++;
				  if(good.getGoods_id().equals(goods_id))
					  {   
					   good.setGoods_number(good.getGoods_number()+goods_number);
					  //已存在则加数量即可
					   cookieIncookie.remove(j);
					   cookieIncookie.add(j,good);
					   isexit=true;break;
					  }
			}
			if(!isexit) {//列表不存在存在该商品
				cookieIncookie.add(item);	
			}
			cookie.setMaxAge(60*60*24*31);
			cookie.setValue(URLEncoder.encode(makeCookieValue(cookieIncookie), "UTF-8"));
			request.setAttribute("addcat","成功加入购物车");
			response.addCookie(cookie);
		}
		 request.setAttribute("message","加入购物车成功，3秒后反回主界面");
	     request.getRequestDispatcher("ShopCatAfter.jsp").forward(request,response);
	}
	
}
