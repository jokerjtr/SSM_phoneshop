 package com.jtr.shop.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jtr.shop.Domain.Address;
import com.jtr.shop.Domain.Orders;
import com.jtr.shop.Domain.User;
import com.jtr.shop.Domain.UserCustor;
import com.jtr.shop.Domain.UserPxoyVo;
import com.jtr.shop.Domain.goods;
import com.jtr.shop.Domain.goodsCustor;
import com.jtr.shop.Domain.goodsPxoyVo;
import com.jtr.shop.mapper.ShopMapper;
import com.jtr.shop.serviceImp.AddressServiceImp;
import com.jtr.shop.serviceImp.OrderServiceImp;
import com.jtr.shop.serviceImp.ShopServiceImp;
import com.jtr.shop.serviceImp.UserServiceImp;

@Controller

public class UserController {
	@Autowired
	private UserServiceImp userService;
	@Autowired
	private UserPxoyVo userpxoyVo;
	@Autowired
	private UserCustor userCustor;
    @Autowired 
	private ShopMapper shopmapper;
    @Autowired
    private AddressServiceImp address;
    @Autowired
	private ShopServiceImp shopservice;
    @Autowired
	private goods goods;
    @Autowired
    private goodsCustor goodsCustor;
    @Autowired
    private goodsPxoyVo goodsPxoyVo;
    @Autowired
    private Orders orders;
    @Autowired
    private OrderServiceImp ordersService;
	@RequestMapping("/tologin")
	public String tologin(Model model) {

		return "login.jsp";
	}

	@RequestMapping("/login")
	public String login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		userCustor.setUser_name(username);
		userCustor.setUser_password(password);
		userpxoyVo.setUserCustor(userCustor);
		UserCustor isUser = userService.findUserByNameAndPassword(userpxoyVo);
		if (isUser!= null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser",isUser);//创建session对象
			return "redirect:/toindex.action";

		} else {
			request.setAttribute("err", "账号密码错误");
			return "login.jsp";

		}
	}
	//退出登录，消耗session
	@RequestMapping("/quitlogin")
	public String quitlogin(HttpServletRequest request, HttpServletResponse response)
	{   HttpSession session = request.getSession();
	     session.removeAttribute("loginUser");
		return "redirect:/toindex.action";
	}
	
	@RequestMapping("/toregist")
	public String toregist() {
		return "regist.jsp";
	}
	@RequestMapping("/regist")
	public void regist(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String name=request.getParameter("name");
		String issex=request.getParameter("sex");
		String sex=issex.equals("nan")?"男":"女";
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		userCustor.setUser_name(username);
		userCustor.setUser_password(password);
		
		userCustor.setUser_email(email);
		userCustor.setName(name);
		userCustor.setSex(sex);userCustor.setUser_phone(phone);userCustor.setUser_address(address);
		userpxoyVo.setUserCustor(userCustor);
		UserCustor isexits = userService.findUserByName(userpxoyVo);
		if(isexits==null) {
			
			userService.insertUser(userpxoyVo);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
	}
	//用ajax判断用户名是否已经存在
	@RequestMapping("/exits")
	public void exits(HttpServletRequest request,HttpServletResponse response) throws IOException {
		    String name=request.getParameter("username");
		    userCustor.setUser_name(name);
		    userpxoyVo.setUserCustor(userCustor);
		    UserCustor isuser = userService.findUserByName(userpxoyVo);
		    response.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html;charset=UTF-8");
		   
		    if(isuser!=null){
		    	response.getWriter().print("用户已存在");
		    	
		    }
		    else {
		    	response.getWriter().print("ok");
		    }
		    
	}
	//确认提交订单
	@RequestMapping("/toconfirmorder")
	public String toconfirmorder(HttpServletRequest request,HttpServletResponse response)
	{    //如果有id
		//goodsCustor findByGoodsId(goodsPxoyVo goodsPxoyVo)
		 String goods_image=null;
		 String goods_name=null;
		 String goods_color=null;
		 String goods_ram=null;
		 Double goods_price=0.0;
		 String goodsnumber=null;
		 //以id传入
		 String goods_id=request.getParameter("id");
		 if(goods_id!=null) {
			 goodsCustor.setGoods_id(goods_id);
			 goodsPxoyVo.setGoodsCustor(goodsCustor);
			 goodsCustor findByGoodsId = shopservice.findByGoodsId(goodsPxoyVo);
			 goods_image=findByGoodsId.getGoods_image();
			 goods_name=findByGoodsId.getGoods_name();
			 goods_color=findByGoodsId.getGoods_color();
			 goods_ram=findByGoodsId.getGoods_netword();
			 goods_price=findByGoodsId.getGoods_price();
			 
		 }
		 else {
		  goods_image=request.getParameter("goods_image"); 
		  goods_name=request.getParameter("goods_name");
	      goods_color=request.getParameter("goods_color");
	      goods_ram=request.getParameter("goods_ram");
	      goods_price=Double.valueOf(request.getParameter("money"));
		 }
	     goodsnumber=request.getParameter("goods_number");
	     Integer goods_number;
	     if(goodsnumber!=null&&goodsnumber!="")
	     { goods_number=Integer.valueOf(goodsnumber);}
	     else {
	    	 goods_number=1;
	    	 
	     }
	     
	     request.setAttribute("orderimage",goods_image);
	     request.setAttribute("order_name",goods_name);
	     request.setAttribute("order_color",goods_color);
	     request.setAttribute("order_ram",goods_ram);
	     request.setAttribute("order_price",goods_price);
	     request.setAttribute("order_number",goods_number);
	     request.setAttribute("order_total",goods_number*goods_price);
		 
	    
	     HttpSession session = request.getSession();
	     //根据用户的id来查找用户的收货地址信息类表
	     UserCustor users = (UserCustor) session.getAttribute("loginUser");
	    
	     List<Address> findmessage = address.findmessage(users.getUser_id());
	    
	     request.setAttribute("address",findmessage);
	     return "confirmorder.jsp";	
	}
	//生成订单
	@RequestMapping("/produceOrder")
	public String produceOrder(HttpServletRequest request,HttpServletResponse response) throws ParseException
	{   HttpSession session = request.getSession();
	    UserCustor users = (UserCustor) session.getAttribute("loginUser");
	    Integer userid=users.getUser_id();//用户编号id 
		String goods_name=request.getParameter("goods_name");
		String goods_color=request.getParameter("goods_color");
		String goods_ram=request.getParameter("goods_ram");
		String goods_price1=request.getParameter("goods_price");//商品的单价
		String goods_number1=request.getParameter("goods_number");//商品数量
		String goods_total=request.getParameter("goods_total");//商品总价
		String address=request.getParameter("address");
		String pay_type=request.getParameter("pay_type");
		goods.setGoods_name(goods_name);
		goods.setGoods_netword(goods_ram);
		goods.setGoods_color(goods_color);
		String goods_id=shopservice.findBygoodsnameAndRamAndColor(goods);
		
		String order_id=UUID.randomUUID().toString() ;
		order_id=order_id.substring(0, 17);
		orders.setOrder_id(order_id);
		orders.setUser_id(userid);
		orders.setGoods_id(goods_id);
		Integer goods_number=Integer.parseInt(goods_number1);//商品个数
		orders.setGoods_number(goods_number);
		Double goods_price=Double.parseDouble(goods_price1);//商品单价
		orders.setGoods_money(goods_price);
		Double goods_total_money=Double.parseDouble(goods_total);
		orders.setGoods_total_money(goods_total_money);//订单总价
		Integer addr_id=Integer.parseInt(address);//地址编号
		orders.setAddr_id(addr_id);
		String pay=pay_type.equals("0")?"线上支付":"网上支付";
		
		orders.setPay_type(pay);//支付方式
		orders.setSend_type("中通快递");
		orders.setOrder_status(0);
		/*DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String nowdayTime = dateFormat.format(new Date());
		Date nowDate = dateFormat.parse(nowdayTime);*/
		Date nowDate=new Date();
	
		orders.setOrder_time(nowDate);
		orders.setRemark(goods_name+" "+goods_color+" "+goods_ram);
		ordersService.insertOrder(orders);
		
		 return "redirect:/toindex.action";
	}
	
}
