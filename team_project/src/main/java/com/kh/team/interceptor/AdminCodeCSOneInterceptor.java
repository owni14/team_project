package com.kh.team.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class AdminCodeCSOneInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String url=request.getHeader("referer");
		String targetUri=null;
		if(url !=null) {
			targetUri=url.substring(16);
		}
		
		System.out.println(targetUri);
//		System.out.println("url"+url);
//		System.out.println("인터셉터 작동");
		String admin_code = (String)session.getAttribute("admin_code");
		
		//테스트후 적용예정	
//		String regExp="(CS1)([0-9a-zA-Z]*[\\{\\}\\[\\]?.,;:|\\)*~`!^\\-_+<>@\\#$%&\\=\\(\\'\\\"]?)*";
		if (admin_code == null || admin_code.equals("")) {
			response.sendRedirect("/admin/admin_login");
			return false;
		}
		else if(!admin_code.equals("1002")) {
			//총괄책임자 
			if(admin_code.equals("1004")){
				return true;
			}
			session.setAttribute("authorized", "false");
			response.sendRedirect(targetUri);
			return false;
		}


		return true; 
	}
	
	
	
}
