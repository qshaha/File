package com.bilibilimao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.bilibilimao.po.Patient;
import com.bilibilimao.service.PatientService;

@RequestMapping("patient")
@Controller
public class PatientController {
	@Autowired
	private PatientService patientService;
	@RequestMapping("register")
	public String registeredAccount(Patient patient, String answer) {
		int result = patientService.registeredAccount(patient, answer);
		if(result > 0) {
			return "redirect:/login";
		}
		return "register";
	}
}