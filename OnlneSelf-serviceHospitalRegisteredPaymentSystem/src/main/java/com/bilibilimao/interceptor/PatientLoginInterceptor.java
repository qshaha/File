package com.bilibilimao.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.bilibilimao.po.Patient;
import com.bilibilimao.utils.Base64stringAndByteArray;
import com.bilibilimao.utils.SerializeUtils;

import redis.clients.jedis.Jedis;

public class PatientLoginInterceptor implements HandlerInterceptor {
	@Autowired
	private Jedis jedis;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Cookie[] cookies = request.getCookies();
		Patient patient = null;
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("patient")) {
					patient = (Patient)SerializeUtils.unserialize(Base64stringAndByteArray.Base64stringToByteArray(jedis.get(c.getValue())));
					if(patient == null) {
						if(request.getServletPath().equals("/index2")) {
							return true;
						}
						response.sendRedirect("/OnlneSelf-serviceHospitalRegisteredPaymentSystem/login");
						return false;
					}
					else {
						request.setAttribute("patientinfo", patient);
						jedis.expire(c.getValue(), 1800);
						c.setMaxAge(1800);
						c.setPath("/OnlneSelf-serviceHospitalRegisteredPaymentSystem");
						response.addCookie(c);
						return true;
					}
				}
			}
		}
		if(request.getServletPath().equals("/index2")) {
			return true;
		}
		response.sendRedirect("/OnlneSelf-serviceHospitalRegisteredPaymentSystem/login");
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