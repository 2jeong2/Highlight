package com.jcm.highlight.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

@Component
public class PermissionInterceptor {

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		
		
		//로그인 정보
		HttpSession session = request.getSession();
		
		//현재 요청한 url의 path(uri) ex)/user/signin_view
		String uri = request.getRequestURI();
		
		//로그인 상태
		if(session.getAttribute("userId") != null) {
			
			//로그인 화면과 , 회원가입 화면 접근 못하게
			//리스트 화면으로 이동
			if(uri.startsWith("/user/")) {
				//리스트 페이지로 이동
				response.sendRedirect("/post/timeline_view");
				return false;
			}
			
			}else {
				
				if(uri.startsWith("/post/")){
					response.sendRedirect("/user/signin_view");
					return false;
			}
		}
		return true;
	}
}
