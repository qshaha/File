package com.bilibilimao.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bilibilimao.po.Administrators;
import com.bilibilimao.po.Doctor;
import com.bilibilimao.service.AdministratorsService;
import com.bilibilimao.utils.PrintException;

@RequestMapping("admin")
@Controller
public class AdministratorsController {
	@Autowired
	private AdministratorsService administratorsService;
	@RequestMapping(value = "login", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String adminLogin(Administrators administrators, HttpServletResponse response) {
		String uuid = administratorsService.findAdministratorsAndLogin(administrators);
		if(uuid != null) {
			Cookie cookie = new Cookie("user", uuid);
			cookie.setMaxAge(1800);
			cookie.setPath("/HospitalRegisteredPaymentSystemDoctorClient");
			response.addCookie(cookie);
			return "{\"result\":\"登录成功\",\"content\":\"请点击确定进行转跳\",\"redirect\":\"/HospitalRegisteredPaymentSystemDoctorClient/index\"}";
		}
		else {
			return "{\"result\":\"登录失败\",\"content\":\"用户名或密码错误请重试\",\"redirect\":\"/HospitalRegisteredPaymentSystemDoctorClient/login\"}";
		}
	}
	@RequestMapping(value = "resetPassword", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String resetPassword(Administrators administrators, String oldPassword, HttpServletRequest request) {
		Administrators administrators2 = (Administrators)request.getAttribute("user");
		if(!oldPassword.equals(administrators2.getPassword())) {
			return "{\"result\":\"失败\",\"content\":\"旧密码错误，请重试！\",\"redirect\":\"/HospitalRegisteredPaymentSystemDoctorClient/resetPassword\"}";
		}
		administrators.setId(administrators2.getId());
		try {
			administratorsService.updateAdministratorsPassword(administrators);
			return "{\"result\":\"成功\",\"content\":\"密码修改成功，请重新登录\",\"redirect\":\"/HospitalRegisteredPaymentSystemDoctorClient/logout\"}";
		} 
		catch (Exception e) {
			PrintException.printExceptionToFile(e);
			return "{\"result\":\"失败\",\"content\":\"密码修改失败，请重试\",\"redirect\":\"/HospitalRegisteredPaymentSystemDoctorClient/resetPassword\"}";
		}
	}
}