package com.txg.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.txg.project.domain.Lecturer;
import com.txg.project.service.LecturerService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private LecturerService lecturerService;
	
	@RequestMapping(value="/loginUI")
	public String loginUI() {
		return "login";
	}
	
	@RequestMapping("/login")
	public String login(
			@RequestParam(value="username", required=true, defaultValue="null")String username,
			@RequestParam(value="password", required=true, defaultValue="null")String password) {
		Lecturer lecturer= new Lecturer();
		try {
			lecturer.setLecturerId(Integer.parseInt(username));
			lecturer.setPassword(password);
		} catch (Exception e) {
			// TODO: handle exception
		}
		Lecturer loginResult = lecturerService.lecturerLogin(lecturer);
		if(loginResult!=null) {
			System.out.println("Login Successfully!");
		}else {
			System.out.println("Login Fail");
		}
		return "login";
	}
}
