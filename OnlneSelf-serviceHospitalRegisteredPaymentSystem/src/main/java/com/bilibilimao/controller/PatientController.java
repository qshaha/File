package com.bilibilimao.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.bilibilimao.po.Patient;
import com.bilibilimao.service.PatientService;

@RequestMapping("patient")
@Controller
public class PatientController {
	@Autowired
	private PatientService patientService;
	@RequestMapping("register")
	public ModelAndView registeredAccount(Patient patient, String answer) {
		ModelAndView modelAndView = new ModelAndView();
		int result = patientService.registeredAccount(patient, answer);
		if(result > 0) {
			modelAndView.setViewName("redirect:/login");
			return(modelAndView);
		}
		modelAndView.addObject("erro", "注册失败请重试");
		modelAndView.addObject("redirectpage", "/register");
		return(modelAndView);
	}
	@RequestMapping("login")
	public ModelAndView loginAccount(HttpServletResponse response, Patient patient) {
		ModelAndView modelAndView = new ModelAndView();
		patient = patientService.findPatient(patient);
		if(patient == null) {
			modelAndView.addObject("erro", "身份证或密码错误请重试");
			modelAndView.addObject("redirectpage", "/login");
			modelAndView.setViewName("erro");
		}
		else {
			String uuid = patientService.addPatientToRedis(patient);
			Cookie cookie = new Cookie("patient", uuid);
			cookie.setPath("/OnlneSelf-serviceHospitalRegisteredPaymentSystem");
			cookie.setMaxAge(1800);
			response.addCookie(cookie);
			modelAndView.setViewName("redirect:/index2");
		}
		return(modelAndView);
	}
	@RequestMapping("forget")
	public ModelAndView findPassword(Patient patient) {
		ModelAndView modelAndView = new ModelAndView();
		int success = patientService.updateToFindPassword(patient);
		if(success > 0) {
			modelAndView.addObject("success", "密码修改成功！");
			modelAndView.addObject("redirectpage", "/login");
			modelAndView.setViewName("success");
		}
		else {
			modelAndView.addObject("erro", "密码修改失败，请重试");
			modelAndView.addObject("redirectpage", "/forget");
			modelAndView.setViewName("erro");
		}
		return(modelAndView);
	}
}