package com.jtr.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jtr.shop.Domain.Band;
import com.jtr.shop.serviceImp.BandServiceImp;

@Controller
@RequestMapping("/admin")
public class banduploadController {
     @Autowired
     private BandServiceImp bandservice;
	  @RequestMapping("/tobandfileup")
      public ModelAndView tobandfileup() {
		  ModelAndView modelAndView=new ModelAndView();
		  modelAndView.setViewName("bandfileup.jsp");
		   return modelAndView; 
	  }
	  @RequestMapping("/toupdateband")
	  public ModelAndView toupdateband(Band band,Model model)
	  {   bandservice.insertband(band);
		  ModelAndView modelAndView=new ModelAndView();
		  modelAndView.setViewName("bandfileup.jsp");
		  return modelAndView;
		   
	  }
}
