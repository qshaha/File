package com.bilibilimao.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import redis.clients.jedis.Jedis;

public class ReLoginInterceptor implements HandlerInterceptor {
	@Autowired
	private Jedis jedis;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("patient")) {
					jedis.expire(c.getValue(), 1800);
					c.setMaxAge(1800);
					c.setPath("/OnlneSelf-serviceHospitalRegisteredPaymentSystem");
					response.addCookie(c);
					response.sendRedirect("/OnlneSelf-serviceHospitalRegisteredPaymentSystem/index2");
					return false;
				}
			}
		}
		return true;
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