package com.bilibilimao.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bilibilimao.po.Administrators;

public class PermissionInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Object obj = request.getAttribute("user");
		if(obj instanceof Administrators) {
			return true;
		}
		request.setAttribute("erro", "权限不足！无法访问该网页");
		request.setAttribute("redirectpage", "/index");
		request.getRequestDispatcher("/erro").forward(request, response);
		return false;
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}