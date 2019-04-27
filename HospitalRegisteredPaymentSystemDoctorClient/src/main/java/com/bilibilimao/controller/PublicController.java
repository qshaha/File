package com.bilibilimao.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.bilibilimao.service.PublicService;

@Controller
public class PublicController {
	@Autowired
	private PublicService publicService;
	@RequestMapping("{page}")
	public String main(@PathVariable String page) {
		return(page);
	}
	@RequestMapping("logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("user")) {
					publicService.deleteUserByRedis(cookie.getValue());
					cookie.setMaxAge(0);
					cookie.setPath("/HospitalRegisteredPaymentSystemDoctorClient");
					response.addCookie(cookie);
				}
			}
		}
		return "redirect:/index";
	}
}