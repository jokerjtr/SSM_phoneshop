package com.jtr.shop.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jtr.shop.Domain.goods ;
import com.jtr.shop.Domain.Band;
import com.jtr.shop.Domain.goodsCustor;
import com.jtr.shop.mapper.ShopMapper;
import com.jtr.shop.serviceImp.ShopServiceImp;

import net.sf.json.JSONArray;

import com.jtr.shop.Domain.goodsPxoyVo;
import com.jtr.shop.Domain.json;
@Controller
public class indexController {
	@Autowired
	private ShopMapper shopmapper;
	@Autowired
	private goodsCustor goodsCustor;
	@Autowired
	private Band band;
	@Autowired
	private ShopServiceImp shopservice;
	@Autowired
	private goodsPxoyVo goodsPxoyVo;
	@Autowired
	private goods goods;
    @RequestMapping("/toindex")
    public String toindex(Model model)
    {      //显示热门商品
    	goodsCustor.setGoods_status(1);
    	goodsPxoyVo.setGoodsCustor(goodsCustor);
    	List<goodsCustor> findGoodsolad = shopservice.findGoodsolad(goodsPxoyVo);
          model.addAttribute("shop",findGoodsolad); 
		return "index.jsp";
    	
    }
    @RequestMapping("/tomay")
	public String tomay(HttpServletRequest request,HttpServletResponse response)
	{    //根据名字和价格来确定
    	  String goods_name=request.getParameter("goods_name");
	      String goods_price=request.getParameter("goods_price");
	      if(goods_name!=null&&goods_name!="")
	      {
	      List<String> goods_color = shopservice.findGoodsDistnctColor(goods_name);
	      List<String> goods_ram = shopservice.findGoodsDistnctRAM(goods_name);
	      List<String> goods_image = shopservice.findGoodsDistnctimage(goods_name);
	      request.setAttribute("goods_image",goods_image);
	      request.setAttribute("goods_name",goods_name);
	      request.setAttribute("goods_price", goods_price);
	      request.setAttribute("goods_color", goods_color);
	      request.setAttribute("goods_ram",goods_ram);
	      }
	     
	      
		  return "tomay.jsp";
		
	}
    @RequestMapping("/checkmoney")
    public void checkmoney(HttpServletRequest request,HttpServletResponse response) throws IOException {
    	String goods_name=request.getParameter("goods_name");
    	String goods_color=request.getParameter("goods_color");
    	String goods_netword=request.getParameter("goods_netword");
    	
    	goods.setGoods_name(goods_name);
    	goods.setGoods_color(goods_color);
    	goods.setGoods_netword(goods_netword);
    	Double money = shopservice.findmoneyBycolorOrRam(goods);
    	response.getWriter().print(money);
    	
    }
    
    //json+ajax，实现点击品牌英文名来实现品牌展示
    @RequestMapping("/findenname")
    public @ResponseBody void findenname(HttpServletRequest request,HttpServletResponse response) throws IOException
    {  
       String en_name=request.getParameter("en_name");
    	 List<goods> goods = shopservice.findBybandEnName(en_name);
    	/* System.out.println("元素个数+"+goods.size());*/
    	 JSONArray array=JSONArray.fromObject(goods);
    	 response.setCharacterEncoding("UTF-8");
    	 response.setContentType("text/html;charset=UTF-8");
    	 response.getWriter().print(array.toString());
    }
}
