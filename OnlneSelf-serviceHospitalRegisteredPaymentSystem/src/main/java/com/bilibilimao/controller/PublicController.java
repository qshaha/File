package com.bilibilimao.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bilibilimao.po.Patient;
import com.bilibilimao.service.PublicService;

@Controller
public class PublicController {
	@Autowired
	private PublicService publicService;
	@RequestMapping("{page}")
	public String main(@PathVariable String page) {
		return(page);
	}
	@RequestMapping("validcode")
	public void verificationCode(HttpServletRequest request, HttpServletResponse response, String codeName) {
		String code = "";
		BufferedImage bufferedImage = new BufferedImage(80, 38, BufferedImage.TYPE_INT_RGB);
		Graphics2D graphics2d = bufferedImage.createGraphics();
		graphics2d.setColor(Color.WHITE);
		graphics2d.fillRect(0, 0, 80, 38);
		Random random = new Random();
		graphics2d.setFont(new Font("宋体", Font.ITALIC|Font.BOLD, 20));
		Color[] colors = {Color.RED, Color.ORANGE, Color.YELLOW, Color.GREEN, Color.CYAN, Color.BLUE};
		for(int i = 0; i < 4; i += 1) {
			graphics2d.setColor(colors[random.nextInt(colors.length)]);
			String s = String.valueOf(random.nextInt(10));
			graphics2d.drawString(s, i * 20, 20 + random.nextInt(19));
			code += s;
		}
		for(int i = 0; i < 3; i += 1) {
			graphics2d.setColor(colors[random.nextInt(colors.length)]);
			graphics2d.drawLine(0, random.nextInt(39), 80, random.nextInt(39));
		}
		try {
			ServletOutputStream servletOutputStream = response.getOutputStream();
			ImageIO.write(bufferedImage, "jpg", servletOutputStream);
		} 
		catch (IOException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		session.setAttribute(codeName, code);
	}
	@RequestMapping("checkcode")
	@ResponseBody
	public String checkCode(HttpServletRequest request, String code, String codeName) {
		String sessionCode = (String)request.getSession().getAttribute(codeName);
		if(code.equals(sessionCode)) {
			return("yes");
		}
		return("no");
	}
	@RequestMapping("idCardIsRegistered")
	@ResponseBody
	public String idCardIsRegistered(Patient patient) {
		boolean b = publicService.idCardIsRegistered(patient);
		if(b == true) {
			return "true";
		}
		return "false";
	}
	@RequestMapping(value = "idCardFindPassword", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String idCardFindPassword(Patient patient) {
		String s = publicService.idCardFindPassword(patient);
		if(s == null) {
			return "{\"false\":\"false\"}";
		}
		else {
			return(s);
		}
	}
	@RequestMapping("getOldPassword")
	@ResponseBody
	public String getOldPassword(String uuid) {
		String oldPassword = publicService.findOldPassword(uuid);
		return(oldPassword);
	}
}