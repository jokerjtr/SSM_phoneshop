package com.jtr.shop.Interfactor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.jtr.shop.Domain.User;


/**
 * 
 * µÇÂ¼À¹½ØÆ÷
 * @author Administrator
 *
 */
public class LoginInterfactor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		  HttpSession session = request.getSession();
		 User user = (User) session.getAttribute("loginUser");
		 if(user!=null)return true;
		 else {
			 request.getRequestDispatcher("login.jsp").forward(request,response);
	            
			 return false;
		 }
		
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	

	

}
