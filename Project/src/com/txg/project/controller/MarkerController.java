package com.txg.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.txg.project.domain.Lesson;
import com.txg.project.domain.Tutor;
import com.txg.project.service.MarkerService;
import com.txg.project.service.TutorLessonService;

@Controller
@RequestMapping("/marker")
public class MarkerController {

	@Autowired
	private MarkerService markerService;
	@Autowired
	private TutorLessonService tutorLessonService;

	@RequestMapping(value = "profile_list")
	public String showProfile(HttpSession session, Model model) {
		Tutor tutor = (Tutor) session.getAttribute("tutor");
		tutor = markerService.findMarkerById(tutor.getTutorId());
		List<Lesson> history = tutorLessonService.findLessonsByTutorId(tutor.getTutorId());

		model.addAttribute("tutor", tutor);
		model.addAttribute("history", history);

		return "/marker_profile";
	}

	@RequestMapping(value = "updateProfile")
	public String updateProfile(HttpSession session, Model model,
			@RequestParam(value = "tutor_id", required = false) Integer tutorId,
			@RequestParam(value = "tutor_name", required = false) String tutorName,
			@RequestParam(value = "tutor_phone", required = false) String tutorPhone,
			@RequestParam(value = "o_password", required = false) String OPassword,
			@RequestParam(value = "n_password", required = false) String NPassword) {
		Tutor tutor = markerService.findMarkerById(tutorId);
		if (OPassword != null && !OPassword.equals("")) {
			if (OPassword.equals(tutor.getPassword()) && !NPassword.equals("")) {
				tutor.setPassword(NPassword);
			}
		}
		if (tutorName != null && !tutorName.equals("")) {
			tutor.setTutorName(tutorName);
		}
		if (tutorPhone != null && !tutorPhone.equals("")) {
			tutor.setTutorPhone(tutorPhone);
		}

		Integer result = markerService.updateMarker(tutor);
		if (result == 0) {
			model.addAttribute("operation", false);
			model.addAttribute("msg", "Update Fail");
		} else {
			model.addAttribute("operation", true);
			model.addAttribute("msg", "Update Success");
		}
		return "redirect:profile_list";
	}
}
