package com.jtr.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jtr.shop.serviceImp.BandServiceImp;
import com.jtr.shop.serviceImp.SalesProdsServiceImp;
import com.jtr.shop.Domain.*;
/**
 * ����ͳ��controller(admin)
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/admin")
public class SalesController {
	@Autowired 
	private SalesProdes sales;
	@Autowired
	private SalesProdsServiceImp salesProdesService;
	@Autowired
	private BandServiceImp bandService;
	private pageBean pageBean;
	
	@RequestMapping("/tosales")
	public String tosales(HttpServletRequest request,HttpServletResponse response)
	{   String bandname=request.getParameter("bandname");//��ѯƷ�ƣ�
	    Integer page=Integer.parseInt(request.getParameter("page"));//��ǰҳ��
	    String desc=request.getParameter("desc");
	     
	    sales.setShowbandname(bandname);
	    sales.setDesc(desc);
	  
	    Integer findtotal = salesProdesService.findtotal(sales);
	  
	    pageBean=new pageBean(page,5,findtotal);
	    sales.setPage(pageBean);
	    List<SalesProdes> findsales = salesProdesService.findsales(sales);
	    pageBean.setShop(findsales);
	    List<Band> findBand = bandService.findBand();
	    request.setAttribute("band",findBand);
	    request.setAttribute("pageBean", pageBean);
	    request.setAttribute("bandname", bandname);//��ǰҳ����ѡ���Ʒ��
	    request.setAttribute("desc",desc.equals("0")?"0":"1");
		return "salesprods.jsp";

	}

}
