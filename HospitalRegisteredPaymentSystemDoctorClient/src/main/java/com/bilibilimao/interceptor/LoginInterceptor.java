package com.bilibilimao.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bilibilimao.utils.SerializeAndBase64string;

import redis.clients.jedis.Jedis;

public class LoginInterceptor implements HandlerInterceptor {
	@Autowired
	private Jedis jedis;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("user")) {
					Object obj = SerializeAndBase64string.Base64stringToSerialize(jedis.get(cookie.getValue()));
					if(obj == null) {
						if(request.getServletPath().equals("/index")) {
							return true;
						}
						response.sendRedirect("/HospitalRegisteredPaymentSystemDoctorClient/login");
						return false;
					}
					else {
						request.setAttribute("user", obj);
						jedis.expire(cookie.getValue(), 1800);
						cookie.setMaxAge(1800);
						cookie.setPath("/HospitalRegisteredPaymentSystemDoctorClient");
						response.addCookie(cookie);
						return true;
					}
				}
			}
		}
		if(request.getServletPath().equals("/index")) {
			return true;
		}
		response.sendRedirect("/HospitalRegisteredPaymentSystemDoctorClient/login");
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