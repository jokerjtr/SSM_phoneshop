package com.jtr.shop.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jtr.shop.Domain.Admin;
import com.jtr.shop.Domain.Band;
import com.jtr.shop.Domain.goods;
import com.jtr.shop.Domain.goodsCustor;
import com.jtr.shop.Domain.goodsPxoyVo;
import com.jtr.shop.Domain.pageBean;
import com.jtr.shop.serviceImp.AdminServiceImp;
import com.jtr.shop.serviceImp.BandServiceImp;
import com.jtr.shop.serviceImp.ShopServiceImp;

@Controller
@RequestMapping("/admin")
public class adminController {
	@Autowired 
	private Admin admin;
	@Autowired
	private AdminServiceImp adminservice;
/*	@Autowired 
	private goods good;*/
	@Autowired
	private Band band;
	@Autowired
	private ShopServiceImp shopservice;
	 @Autowired
	 private goodsCustor goodsCustor;
	 @Autowired
	 private goodsPxoyVo goodsPxoyVo;
	 @Autowired 
	 private BandServiceImp bandservice;
	 private pageBean page;
	@RequestMapping("/toadmin")
    public String toadmin() {
		//去登录界面
		return "adminlogin.jsp";
	   
   }
	@RequestMapping("/toindex")
	public String toindex(HttpServletRequest request,HttpServletResponse response) 
	{       return "index.jsp";
	//主页
		
	}
	
	@RequestMapping("/tologin")
	public ModelAndView tologin(HttpServletRequest request,HttpServletResponse response)
	{    ModelAndView modelAndView=new ModelAndView();
		 String admin_name=request.getParameter("admin_user");
	     String admin_password=request.getParameter("admin_psd");
	     admin.setAdmin_name(admin_name);admin.setAdmin_password(admin_password);
	     Admin findByUser = adminservice.findByUser(admin);
	     if(findByUser!=null) {
	    	 HttpSession session = request.getSession();
	    	 String addr=request.getRemoteAddr();
	    	  findByUser.setAddress(addr);
	    	 session.setAttribute("admin",findByUser);
	    	 Date date=new Date();
	    	 //登录
	    	 
	    	 admin.setPredate(date);
	    	 adminservice.Updatetiem(admin);
	    	 modelAndView.setViewName("redirect:/admin/toindex.action");
	    	
	    	 
	     }
	     else {
	    	 modelAndView.setViewName("adminlogin.jsp");
	    	
	     }
		
		 return modelAndView;
	}
	@RequestMapping("/exitlogin")
	public String exitlogin(HttpServletRequest request,HttpServletResponse response)
	{   //退出登录
		HttpSession session = request.getSession();
	   
	    session.removeAttribute("admin");
	   
		return "redirect:/admin/toadmin.action";
		
	}
	@RequestMapping("/toupdatepsd")
	public ModelAndView toupdatepsd()
	{
		
		ModelAndView modelAndview=new ModelAndView();
		modelAndview.setViewName("updatepsd.jsp");
		return modelAndview;
	}
	//重设密码
	@RequestMapping("/repsd")
	public String repsd(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{     String admin_psd=request.getParameter("psd");
		  String admin_password=request.getParameter("newpsd");
		  HttpSession session = request.getSession();
	      Admin attribute = (Admin) session.getAttribute("admin");
	     
	      if(admin_psd.equals(attribute.getAdmin_password())) {
	    	  //不为空则可修改密码
	    	  attribute.setAdmin_password(admin_password);
	    	  adminservice.updatepsd(attribute);
	    	  
	    	 return "redirect:/admin/exitlogin.action";  
	      }else
	      {
	    	  
	    	  return "updatepsd.jsp";
	      }
	      	
	}
	//商品显示信息页面
	@RequestMapping("/toshowshop")
	public ModelAndView toshowshop(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		//当bandname为*为搜索全部产品，但品牌时为特定的品牌
		Integer pageNum=Integer.parseInt(request.getParameter("pageNum"));//当前页面
    	String band_name=URLDecoder.decode(request.getParameter("bandname"),"UTF-8") ;//产品类型
    	
    	List<Band> findBand = bandservice.findBand();
    	//搜索所有商品
    	if(band_name.equals("")||band_name.equals("*"))
    	{
    		Integer findCount = shopservice.findCount();// 商品总数
    		page = new pageBean(pageNum,5, findCount);
    		goodsCustor.setPage(page);
    		List<goodsCustor> findByBandnamePage = shopservice.findtotalgoodsPage(goodsCustor);
    		 page.setShop(findByBandnamePage);
    		 ModelAndView modelAndView=new ModelAndView();
    		 Object attribute = request.getAttribute("goodsPage");
    		 if(attribute!=null)
         	{request.removeAttribute("goodsPage");request.removeAttribute("bandname");}
    		//搜索当前商品下的所属品牌信息
    		Iterator<goodsCustor> iterator = findByBandnamePage.iterator();
    		List<String>bandlist=new ArrayList<String>();
    		while(iterator.hasNext())
    		{
    			String findBandname = bandservice.findBandname(iterator.next().getBand_id());
    			bandlist.add(findBandname);
    		}
    		modelAndView.addObject("goodsPage",page);
 			modelAndView.addObject("bandname",band_name);
 			modelAndView.addObject("band_name",bandlist);//band_name为当前品牌
 			modelAndView.addObject("bandlist",findBand);
 			modelAndView.setViewName("showshop.jsp");
 			
 			
 			return modelAndView;
    	}
    	//搜索品牌（特定）
    	else {
    	   band.setBand_name(band_name);
 		   goodsCustor.setBand(band);
 		   Integer findByBandnameCount = shopservice.findByBandnameCount(goodsCustor);//该品牌下的商品总数
 		   page=new pageBean(pageNum,5,findByBandnameCount);
 		   goodsCustor.setPage(page);
 		 
 		
 		   List<goodsCustor> findByBandnamePage = shopservice.findByBandnamePage(goodsCustor);
 		  
 		   page.setShop(findByBandnamePage);
 		   ModelAndView modelAndView = new ModelAndView();
 		   Object attribute = request.getAttribute("goodsPage");
            if(attribute!=null)
            	{request.removeAttribute("goodsPage");
            	request.removeAttribute("bandname");}
          //搜索当前商品下的所属品牌信息
              Iterator<goodsCustor> iterator = findByBandnamePage.iterator();
              List<String>bandlist=new ArrayList<String>();
              while(iterator.hasNext()) {
            	  bandlist.add(iterator.next().getBand().getBand_name());
              }
			   modelAndView.addObject("goodsPage", page);
			   modelAndView.addObject("bandname", band_name);
			   modelAndView.addObject("band_name",bandlist);//band_name为当前品牌
			   modelAndView.addObject("bandlist",findBand);
			   modelAndView.setViewName("showshop.jsp");

			   return modelAndView;
 		  
    	}
	}
	//商品下架
	@RequestMapping("/undercarriage")
	public ModelAndView undercarriage(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{    Integer pageNum=Integer.parseInt(request.getParameter("pageNum"));//当前页面
	     String band_name=request.getParameter("bandname");//产品类型
	     String goods_id=request.getParameter("id");
	     shopservice.deleteGoods(goods_id);
	     ModelAndView modelAndView=new ModelAndView();
	    
	     //重定向get中文会乱码，进行编码
	     modelAndView.setViewName("forward:/admin/toshowshop.action?pageNum="+pageNum+"&bandname="+URLEncoder.encode(band_name,"UTF-8"));
	    
		return modelAndView;
		
	}
		
	
}
