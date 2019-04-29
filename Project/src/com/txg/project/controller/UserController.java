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
			@RequestParam(value="email", required=true, defaultValue="null")String email,
			@RequestParam(value="password", required=true, defaultValue="null")String password,
			@RequestParam(value="id", required=true, defaultValue="Professor")String id,
			Model model) {
			
		if (id.equals("PROFESSOR")) {
			Lecturer lecturer = lecturerService.lecturerLogin(email, password);
			if (lecturer!=null) {
				model.addAttribute("msg", true);
				model.addAttribute("lecturer", lecturer);
				System.out.println(lecturer);
				return "menu";
			}else {
				model.addAttribute("msg", false);
			}
		}else if(id.equals("TUTOR")) {
			
		}
		return "login";
	}
}
