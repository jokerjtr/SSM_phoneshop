package com.jtr.shop.Interfactor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.jtr.shop.Domain.Admin;

/**
 * 管理员类权限
 * @author Administrator
 *
 */
public class AdminLoginfactor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		    HttpSession session = request.getSession();
		    Admin admin = (Admin) session.getAttribute("admin");
		    if(admin!=null) return true;
		    else {
		    	 request.getRequestDispatcher("adminlogin.jsp").forward(request, response);
		    	 /*response.sendRedirect("adminlogin.jsp");*/
		    	 return false;
		    }
	       }
	
  
}
