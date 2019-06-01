package com.txg.project.controller;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.txg.project.domain.Lecturer;
import com.txg.project.domain.Tutor;
import com.txg.project.service.LecturerService;
import com.txg.project.service.TutorLessonService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private LecturerService lecturerService;
	@Autowired
	private TutorLessonService tutorLessonService;
	
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
				return "redirect:/dashboard/dashboardUI";
			}else {
				model.addAttribute("operation", false);
	        	model.addAttribute("msg", "Login Fail");
			}
		}else if(id.equals("TUTOR")) {
			Tutor tutor = tutorLessonService.tutorLogin(email, password);
			if (tutor != null) {
				model.addAttribute("msg", true);
				model.addAttribute("tutor", tutor);
				session.setAttribute("id", "Tutor");
				session.setAttribute("tutor", tutor);
				//return "marker_dashboard";
				//return "redirect:/marker/profile_list";
				return "redirect:/dashboard/markerDashboard";
			}else {
				model.addAttribute("operation", false);
	        	model.addAttribute("msg", "Login Fail");
			}
		}
		return "login";
	}
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "login";
	}
}
