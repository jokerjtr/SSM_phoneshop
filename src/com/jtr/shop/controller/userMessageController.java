package com.jtr.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jtr.shop.Domain.User;
import com.jtr.shop.Domain.UserCustor;
import com.jtr.shop.Domain.UserPxoyVo;
import com.jtr.shop.serviceImp.UserServiceImp;

/**
 * 会员中心
 * @author Administrator
 *
 */
@Controller
public class userMessageController {
	 @Autowired
	 private UserServiceImp userService;
	 @Autowired
	 private UserPxoyVo userpxoyVo;
	 @Autowired
	 private UserCustor userCustor;
      @RequestMapping("/showusermessage")
      public String showusermessage(HttpServletRequest request,HttpServletResponse response)
      {  HttpSession session = request.getSession();
          User user = (User) session.getAttribute("loginUser");
          userpxoyVo.setUser(user);
          UserCustor findUserByName = userService.findUserByName(userpxoyVo);
     
          request.setAttribute("usermessage",findUserByName);
		  return "usermessage.jsp";
    	  
      }
      @RequestMapping("/updateUserMessage")
      public String updateUserMessage(HttpServletRequest request,HttpServletResponse response)
      {      Integer user_id=Integer.parseInt(request.getParameter("id"));
            
           String name=request.getParameter("name");
           String sex=(request.getParameter("sex").equals("nan")?"男":"女");
           String user_phone=request.getParameter("phone");
           String email=request.getParameter("email");
           String user_address=request.getParameter("address");
           String password=request.getParameter("password");
           userCustor.setUser_id(user_id);
           userpxoyVo.setUserCustor(userCustor);
           if(password==null ||password.equals(""))
           {   
        	   UserCustor findUserById = userService.findUserById(userpxoyVo);
        	   password=findUserById.getUser_password();
           }
           userCustor.setName(name);userCustor.setSex(sex);
           userCustor.setUser_phone(user_phone);userCustor.setUser_password(password);
           userCustor.setUser_email(email);userCustor.setUser_address(user_address);
           userpxoyVo.setUserCustor(userCustor);
           userService.updateUserByid(userpxoyVo);
           return "redirect:/showusermessage.action";
		  
    	  
      }
      
}
