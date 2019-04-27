package com.bilibilimao.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.bilibilimao.po.Administrators;
import com.bilibilimao.po.Doctor;
import com.bilibilimao.service.DoctorService;
import com.bilibilimao.utils.PrintException;
import com.bilibilimao.utils.SelectConversion;
import com.bilibilimao.utils.UUIDGenerator;

@RequestMapping("doctor")
@Controller
public class DoctorController {
	@Autowired
	private DoctorService doctorService;
	@RequestMapping("register")
	public ModelAndView registerNewDoctor(Doctor doctor, String[] weakList) {
		ModelAndView modelAndView = new ModelAndView();
		doctor.setWeak(StringUtils.join(weakList, "|"));
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy");
		String year = simpleDateFormat.format(doctor.getWorkDate());
		String department = (SelectConversion.departmentConversion(doctor.getDepartment()) < 10 ? "0" + SelectConversion.departmentConversion(doctor.getDepartment()) : "" + SelectConversion.departmentConversion(doctor.getDepartment()));
		String education = (SelectConversion.educationConversion(doctor.getEducation()) < 10 ? "0" + SelectConversion.educationConversion(doctor.getEducation()) : "" + SelectConversion.educationConversion(doctor.getEducation()));
		doctor.setAccount(year + department + education + (doctor.getSex().equals("男") ? "01" : "02") + String.valueOf(doctor.getName().hashCode()).substring(0, 2));
		doctor.setPassword("123456");
		try {
			doctorService.insertDoctor(doctor);
			modelAndView.addObject("success", "账号注册成功请记住账号" + doctor.getAccount());
			modelAndView.addObject("redirectpage", "/register");
			modelAndView.setViewName("success");
		} 
		catch (Exception e) {
			PrintException.printExceptionToFile(e);
			modelAndView.addObject("erro", "注册失败，请重试,若仍然不能成功请联系我们");
			modelAndView.addObject("redirectpage", "/register");
			modelAndView.setViewName("erro");
		}
		return(modelAndView);
	}
	@RequestMapping(value = "login", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String doctorLogin(Doctor doctor, HttpServletResponse response) {
		String uuid = doctorService.findDoctorAndLogin(doctor);
		if(uuid != null) {
			Cookie cookie = new Cookie("user", uuid);
			cookie.setMaxAge(1800);
			cookie.setPath("/HospitalRegisteredPaymentSystemDoctorClient");
			response.addCookie(cookie);
			return "{\"result\":\"登录成功\",\"content\":\"请点击确定转跳\",\"redirect\":\"/HospitalRegisteredPaymentSystemDoctorClient/index\"}";
		}
		else {
			return "{\"result\":\"登录失败\",\"content\":\"用户名或密码错误请重试\",\"redirect\":\"/HospitalRegisteredPaymentSystemDoctorClient/login\"}";
		}
	}
	@RequestMapping(value = "cancellation", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String doctorCancellation(Doctor doctor, String adminPassword, HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("user")) {
					if(!((Administrators)request.getAttribute("user")).getPassword().equals(adminPassword)) {
						return "{\"result\":\"失败\",\"content\":\"管理员密码错误！\",\"redirect\":\"\"}";
					}
					try {
						doctorService.deleteDoctor(doctor);
						return "{\"result\":\"成功\",\"content\":\"已删除账号为" + doctor.getAccount() + "的医生\",\"redirect\":\"/HospitalRegisteredPaymentSystemDoctorClient/cancellation\"}";
					} 
					catch (Exception e) {
						PrintException.printExceptionToFile(e);
						return "{\"result\":\"失败\",\"content\":\"删除失败请重试\",\"redirect\":\"/HospitalRegisteredPaymentSystemDoctorClient/cancellation\"}";
					}
				}
			}
		}
		return "{\"result\":\"失败\",\"content\":\"账号已过期请重新登录\",\"redirect\":\"/HospitalRegisteredPaymentSystemDoctorClient/login\"}";
	}
	@RequestMapping(value = "doctorInfo", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<Doctor> showAllDoctor() {
		List<Doctor> doctors = doctorService.findAllDoctor();
		return(doctors);
	}
	@RequestMapping(value = "upload", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String uploadPhoto(Doctor doctor, MultipartFile myPhoto) {
		System.out.println(doctor.getId());
		doctor.setPhoto(UUIDGenerator.normalUUID() + myPhoto.getOriginalFilename().substring(myPhoto.getOriginalFilename().lastIndexOf(".")));
		try {
			doctorService.updateDoctorPhoto(doctor);
			FileUtils.copyInputStreamToFile(myPhoto.getInputStream(), new File("C:/Users/code/Pictures/myPhoto/doctorPhoto/" + doctor.getPhoto()));
			return "{\"code\":0,\"msg\":\"错误\",\"data\":{\"src\":\"http://cdn.layui.com/123.jpg\"}}";
		} 
		catch (Exception e) {
			PrintException.printExceptionToFile(e);
			return "{\"code\":1,\"msg\":\"错误\",\"data\":{\"src\":\"http://cdn.layui.com/123.jpg\"}}";
		}
	}
	@RequestMapping(value = "resetPassword", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String resetPassword(Doctor doctor, String oldPassword, HttpServletRequest request) {
		Doctor doctor2 = (Doctor)request.getAttribute("user");
		if(!oldPassword.equals(doctor2.getPassword())) {
			return "{\"result\":\"失败\",\"content\":\"旧密码错误，请重试！\",\"redirect\":\"/HospitalRegisteredPaymentSystemDoctorClient/resetPassword\"}";
		}
		doctor.setId(doctor2.getId());
		try {
			doctorService.updateDoctorPassword(doctor);
			return "{\"result\":\"成功\",\"content\":\"密码修改成功，请重新登录\",\"redirect\":\"/HospitalRegisteredPaymentSystemDoctorClient/logout\"}";
		} 
		catch (Exception e) {
			PrintException.printExceptionToFile(e);
			return "{\"result\":\"失败\",\"content\":\"密码修改失败，请重试\",\"redirect\":\"/HospitalRegisteredPaymentSystemDoctorClient/resetPassword\"}";
		}
	}
	@RequestMapping(value = "resetDefaultPassword", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String resetDefaultPassword(String doctorAccount, String adminPassword, HttpServletRequest request) {
		Administrators administrators = (Administrators)request.getAttribute("user");
		if(!adminPassword.equals(administrators.getPassword())) {
			return "{\"result\":\"失败\",\"content\":\"管理员密码错误，请重试！\",\"redirect\":\"/HospitalRegisteredPaymentSystemDoctorClient/resetPassword\"}";
		}
		try {
			boolean b = doctorService.updateDoctorDefaultPassword(doctorAccount);
			if(b) {
				return "{\"result\":\"成功\",\"content\":\"密码重成功！\",\"redirect\":\"/HospitalRegisteredPaymentSystemDoctorClient/resetPassword\"}";
			}
			return "{\"result\":\"失败\",\"content\":\"医生账号不存在，请检查账号是否输入正确\",\"redirect\":\"/HospitalRegisteredPaymentSystemDoctorClient/resetPassword\"}";
		} 
		catch (Exception e) {
			PrintException.printExceptionToFile(e);
			return "{\"result\":\"失败\",\"content\":\"密码重置失败，请重试\",\"redirect\":\"/HospitalRegisteredPaymentSystemDoctorClient/resetPassword\"}";
		}
	}
}