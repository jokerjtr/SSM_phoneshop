package com.jtr.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jtr.shop.Domain.Band;
import com.jtr.shop.Domain.goodsCustor;
import com.jtr.shop.mapper.ShopMapper;
import com.jtr.shop.serviceImp.BandServiceImp;
import com.jtr.shop.serviceImp.ShopServiceImp;

@Controller
@RequestMapping("/admin")
public class fileuploadController {
	  @Autowired 
	  private Band band;
	  @Autowired
	  private BandServiceImp bandservice;
	  @Autowired
	  private ShopServiceImp shopservice;
	  @Autowired
	  private ShopMapper shopmapper;
	  @Autowired
	  private goodsCustor goodsCustor;
    @RequestMapping("/toshopupload")
	public ModelAndView toshopupload() {
	 
	     List<Band> findBand = bandservice.findBand();
	     
    	ModelAndView modelAndView=new ModelAndView();
    	modelAndView.addObject("bandlist", findBand);
    	modelAndView.setViewName("shopfileup.jsp");
    	return modelAndView;
    	
    }
    @RequestMapping("/fileup")
    public ModelAndView fileup(@RequestParam(value="upfile")MultipartFile uploadfile,HttpServletRequest request,HttpServletResponse response,RedirectAttributes redirectAttributes) throws IllegalStateException, IOException, ServletException {
       String filename=uploadfile.getOriginalFilename();
 	   String suffix=filename.substring(filename.lastIndexOf("."));
 	   String newfilename=UUID.randomUUID().toString()+suffix;
 	   newfilename=newfilename.replace("-","_");
 	   String paths="F:\\jsp\\Shop_1.1\\WebContent\\image\\fileup";
 	   File file=new File(paths,newfilename);
 	   System.out.println(file);
 	   boolean createNewFile = file.createNewFile();
 	   if(createNewFile) {
 		   uploadfile.transferTo(file);
 	   }
 	   //获取最后一条商品id 
 	  String findlastid = shopservice.findlastid();
 	  Integer id=Integer.parseInt(findlastid);
 	  String goods_id=String.valueOf(id+1);
      String goods_name=request.getParameter("goodsname");
      Double goods_price=Double.parseDouble(request.getParameter("goodsprice"));
      Integer goods_stock=Integer.parseInt(request.getParameter("goodssotck"));
      String goods_image="image\\fileup\\"+file.getName();
     
      String goods_network=request.getParameter("goodsnetwork");
      Integer band_id=Integer.parseInt(request.getParameter("bandid"));
      String goods_color=request.getParameter("goodscolor");
      Integer goods_status=Integer.parseInt(request.getParameter("goodsstatus"));
      goodsCustor.setGoods_id(goods_id);
      goodsCustor.setGoods_name(goods_name);
      goodsCustor.setGoods_color(goods_color);
      goodsCustor.setGoods_netword(goods_network);
      goodsCustor.setGoods_price(goods_price);
      goodsCustor.setGoods_stock(goods_stock);
      goodsCustor.setGoods_image(goods_image);
      goodsCustor.setBand_id(band_id);
      goodsCustor.setGoods_status(goods_status);
      shopmapper.inserdate(goodsCustor);
     ModelAndView modelAndView=new ModelAndView();
     /*modelAndView.setViewName("redirect:/admin/toshowshop.action");
     redirectAttributes.addAttribute("pageNum","1");
     redirectAttributes.addAttribute("bandname","*");*/
     modelAndView.setViewName("shopfileup.jsp");
     return modelAndView;
      
    }
    	
    	
    }


