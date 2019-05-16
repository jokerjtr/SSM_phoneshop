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
		//ȥ��¼����
		return "adminlogin.jsp";
	   
   }
	@RequestMapping("/toindex")
	public String toindex(HttpServletRequest request,HttpServletResponse response) 
	{       return "index.jsp";
	//��ҳ
		
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
	    	 //��¼
	    	 
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
	{   //�˳���¼
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
	//��������
	@RequestMapping("/repsd")
	public String repsd(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{     String admin_psd=request.getParameter("psd");
		  String admin_password=request.getParameter("newpsd");
		  HttpSession session = request.getSession();
	      Admin attribute = (Admin) session.getAttribute("admin");
	     
	      if(admin_psd.equals(attribute.getAdmin_password())) {
	    	  //��Ϊ������޸�����
	    	  attribute.setAdmin_password(admin_password);
	    	  adminservice.updatepsd(attribute);
	    	  
	    	 return "redirect:/admin/exitlogin.action";  
	      }else
	      {
	    	  
	    	  return "updatepsd.jsp";
	      }
	      	
	}
	//��Ʒ��ʾ��Ϣҳ��
	@RequestMapping("/toshowshop")
	public ModelAndView toshowshop(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		//��bandnameΪ*Ϊ����ȫ����Ʒ����Ʒ��ʱΪ�ض���Ʒ��
		Integer pageNum=Integer.parseInt(request.getParameter("pageNum"));//��ǰҳ��
    	String band_name=URLDecoder.decode(request.getParameter("bandname"),"UTF-8") ;//��Ʒ����
    	
    	List<Band> findBand = bandservice.findBand();
    	//����������Ʒ
    	if(band_name.equals("")||band_name.equals("*"))
    	{
    		Integer findCount = shopservice.findCount();// ��Ʒ����
    		page = new pageBean(pageNum,5, findCount);
    		goodsCustor.setPage(page);
    		List<goodsCustor> findByBandnamePage = shopservice.findtotalgoodsPage(goodsCustor);
    		 page.setShop(findByBandnamePage);
    		 ModelAndView modelAndView=new ModelAndView();
    		 Object attribute = request.getAttribute("goodsPage");
    		 if(attribute!=null)
         	{request.removeAttribute("goodsPage");request.removeAttribute("bandname");}
    		//������ǰ��Ʒ�µ�����Ʒ����Ϣ
    		Iterator<goodsCustor> iterator = findByBandnamePage.iterator();
    		List<String>bandlist=new ArrayList<String>();
    		while(iterator.hasNext())
    		{
    			String findBandname = bandservice.findBandname(iterator.next().getBand_id());
    			bandlist.add(findBandname);
    		}
    		modelAndView.addObject("goodsPage",page);
 			modelAndView.addObject("bandname",band_name);
 			modelAndView.addObject("band_name",bandlist);//band_nameΪ��ǰƷ��
 			modelAndView.addObject("bandlist",findBand);
 			modelAndView.setViewName("showshop.jsp");
 			
 			
 			return modelAndView;
    	}
    	//����Ʒ�ƣ��ض���
    	else {
    	   band.setBand_name(band_name);
 		   goodsCustor.setBand(band);
 		   Integer findByBandnameCount = shopservice.findByBandnameCount(goodsCustor);//��Ʒ���µ���Ʒ����
 		   page=new pageBean(pageNum,5,findByBandnameCount);
 		   goodsCustor.setPage(page);
 		 
 		
 		   List<goodsCustor> findByBandnamePage = shopservice.findByBandnamePage(goodsCustor);
 		  
 		   page.setShop(findByBandnamePage);
 		   ModelAndView modelAndView = new ModelAndView();
 		   Object attribute = request.getAttribute("goodsPage");
            if(attribute!=null)
            	{request.removeAttribute("goodsPage");
            	request.removeAttribute("bandname");}
          //������ǰ��Ʒ�µ�����Ʒ����Ϣ
              Iterator<goodsCustor> iterator = findByBandnamePage.iterator();
              List<String>bandlist=new ArrayList<String>();
              while(iterator.hasNext()) {
            	  bandlist.add(iterator.next().getBand().getBand_name());
              }
			   modelAndView.addObject("goodsPage", page);
			   modelAndView.addObject("bandname", band_name);
			   modelAndView.addObject("band_name",bandlist);//band_nameΪ��ǰƷ��
			   modelAndView.addObject("bandlist",findBand);
			   modelAndView.setViewName("showshop.jsp");

			   return modelAndView;
 		  
    	}
	}
	//��Ʒ�¼�
	@RequestMapping("/undercarriage")
	public ModelAndView undercarriage(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{    Integer pageNum=Integer.parseInt(request.getParameter("pageNum"));//��ǰҳ��
	     String band_name=request.getParameter("bandname");//��Ʒ����
	     String goods_id=request.getParameter("id");
	     shopservice.deleteGoods(goods_id);
	     ModelAndView modelAndView=new ModelAndView();
	    
	     //�ض���get���Ļ����룬���б���
	     modelAndView.setViewName("forward:/admin/toshowshop.action?pageNum="+pageNum+"&bandname="+URLEncoder.encode(band_name,"UTF-8"));
	    
		return modelAndView;
		
	}
		
	
}
