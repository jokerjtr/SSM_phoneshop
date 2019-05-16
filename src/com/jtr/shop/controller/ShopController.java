package com.jtr.shop.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jtr.shop.Domain.Band;
import com.jtr.shop.Domain.goods;
import com.jtr.shop.Domain.goodsCustor;
import com.jtr.shop.Domain.goodsPxoyVo;
import com.jtr.shop.mapper.ShopMapper;
import com.jtr.shop.serviceImp.AddressServiceImp;
import com.jtr.shop.serviceImp.ShopServiceImp;
import com.jtr.shop.Domain.pageBean;
@Controller
public class ShopController {
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
        private Band band;
	    private pageBean page;
	    //�ֻ�չʾҳ������ͬƷ�Ʒ�ҳ��ʾ��Ʒ
	    @RequestMapping("/tososuoshop")
	    public ModelAndView tososuoshop(HttpServletRequest request,HttpServletResponse response)
        {   String mold=request.getParameter("modl");
        
            if(mold.equals("1")) {
	    	Integer pageNum=Integer.parseInt(request.getParameter("pageNum"));//��ǰҳ��
	    	String band_name=request.getParameter("bandname");//��Ʒ����
	    	if(band_name.equals("*"))
		   {
			Integer findCount = shopservice.findCount();// ��Ʒ����
			page = new pageBean(pageNum, 12, findCount);
			goodsCustor.setPage(page);
			List<goodsCustor> findtotalgoodsPage = shopservice.findtotalgoodsPage(goodsCustor);
			page.setShop(findtotalgoodsPage);
			ModelAndView modelAndView = new ModelAndView();
            Object attribute = request.getAttribute("goodsPage");
            if(attribute!=null)
            	{request.removeAttribute("goodsPage");request.removeAttribute("bandname");}
			modelAndView.addObject("goodsPage",page);
			modelAndView.addObject("bandname",band_name);
			modelAndView.addObject("modl",mold);
			modelAndView.setViewName("sosuoshop.jsp");
           
			return modelAndView;
	    	}
	    	else {
	    		   
	    		   band.setBand_name(band_name);
	    		   goodsCustor.setBand(band);
	    		   Integer findByBandnameCount = shopservice.findByBandnameCount(goodsCustor);//��Ʒ���µ���Ʒ����
	    		   page=new pageBean(pageNum,12,findByBandnameCount);
	    		   goodsCustor.setPage(page);
	    		 
	    		
	    		   List<goodsCustor> findByBandnamePage = shopservice.findByBandnamePage(goodsCustor);
	    		   page.setShop(findByBandnamePage);
	    		   ModelAndView modelAndView = new ModelAndView();
	    		   Object attribute = request.getAttribute("goodsPage");
	               if(attribute!=null)
	               	{request.removeAttribute("goodsPage");
	               	request.removeAttribute("bandname");}
	   			   modelAndView.addObject("goodsPage", page);
	   			   modelAndView.addObject("bandname", band_name);
	   			   modelAndView.addObject("modl",mold);
	   			   modelAndView.setViewName("sosuoshop.jsp");

	   			   return modelAndView;
	    		  
	    		   
	    		}
	    	}else {//����1����������Ʒ����
	    		String message=request.getParameter("bandname");//������Ϣ
		    	Integer pageNum=Integer.parseInt(request.getParameter("pageNum"));//����ҳ��
		    	
		    	goodsCustor.setGoods_name(message);
		        
		        Integer count=shopservice.findgoodscountBygoodsNameLike(goodsCustor);
		        page=new pageBean(pageNum,12,count); 
		        goodsCustor.setPage(page);
		        List<goodsCustor> findgoodsPageBygoodsNameLike = shopservice.findgoodsPageBygoodsNameLike(goodsCustor);
		    	page.setShop(findgoodsPageBygoodsNameLike);
		    	ModelAndView modelAndView=new ModelAndView();
		    	 Object attribute = request.getAttribute("goodsPage");
	             if(attribute!=null)
	             	{request.removeAttribute("goodsPage");
	             	request.removeAttribute("bandname");}
		    	modelAndView.addObject("goodsPage", page);
		    	modelAndView.addObject("bandname",message);
		    	modelAndView.addObject("modl",mold);
		    	modelAndView.setViewName("sosuoshop.jsp");
		    	return modelAndView;
		    	
	    	}
            
	        
	    	
	    }
	  /* //��������ʵ����Ʒ����������
	    @RequestMapping("/sherachshopbandorname")
	    public ModelAndView sherachshopbandorname(HttpServletRequest request,HttpServletResponse response)
	    {
	    	String message=request.getParameter("bandname");//������Ϣ
	    	Integer pageNum=Integer.parseInt(request.getParameter("pageNum"));//����ҳ��
	    	
	    	goodsCustor.setGoods_name(message);
	        
	        Integer count=shopservice.findgoodscountBygoodsNameLike(goodsCustor);
	        page=new pageBean(pageNum,12,count); 
	        goodsCustor.setPage(page);
	        List<goodsCustor> findgoodsPageBygoodsNameLike = shopservice.findgoodsPageBygoodsNameLike(goodsCustor);
	    	page.setShop(findgoodsPageBygoodsNameLike);
	    	ModelAndView modelAndView=new ModelAndView();
	    	 Object attribute = request.getAttribute("goodsPage");
             if(attribute!=null)
             	{request.removeAttribute("goodsPage");
             	request.removeAttribute("bandname");}
	    	modelAndView.addObject("goodsPage", page);
	    	modelAndView.addObject("bandname",message);
	    	modelAndView.setViewName("sosuoshop.jsp");
	    	return modelAndView;
	    	
	    	
	    }
	    */
	    
}
