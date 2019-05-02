package com.txg.project.controller;

import java.lang.ProcessBuilder.Redirect;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.txg.project.domain.Lecturer;
import com.txg.project.domain.Tutor;
import com.txg.project.service.LecturerService;
import com.txg.project.service.TutorService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private LecturerService lecturerService;
	@Autowired
	private TutorService tutorService;
	
	@RequestMapping(value="/loginUI")
	public String loginUI() {
		return "login";
	}
	
	@RequestMapping("/login")
	public String login(
			@RequestParam(value="email", required=true, defaultValue="null")String email,
			@RequestParam(value="password", required=true, defaultValue="null")String password,
			@RequestParam(value="id", required=true, defaultValue="Professor")String id,
			HttpSession session, Model model) {
			
		if (id.equals("PROFESSOR")) {
			Lecturer lecturer = lecturerService.lecturerLogin(email, password);
			if (lecturer!=null) {
				//model.addAttribute("msg", true);
				model.addAttribute("lecturer", lecturer);
				session.setAttribute("id", "Professor");
				session.setAttribute("lecturer", lecturer);
				//return "menu";
				return "redirect:/lesson/lessonlist";
			}else {
				model.addAttribute("msg", false);
			}
		}else if(id.equals("TUTOR")) {
			Tutor tutor = tutorService.tutorLogin(email, password);
			if (tutor != null) {
				model.addAttribute("msg", true);
				model.addAttribute("tutor", tutor);
				session.setAttribute("id", "Tutor");
				session.setAttribute("tutor", tutor);
				return "menu";
			}else {
				model.addAttribute("msg", false);
			}
		}
		return "login";
	}
}
