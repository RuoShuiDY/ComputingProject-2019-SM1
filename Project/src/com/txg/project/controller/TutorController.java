package com.txg.project.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.txg.project.domain.ClassDict;
import com.txg.project.domain.Lecturer;
import com.txg.project.domain.Lesson;
import com.txg.project.domain.Tutor;
import com.txg.project.domain.TutorLesson;
import com.txg.project.service.LessonService;
import com.txg.project.service.TutorLessonService;
import com.txg.project.utils.RandomString;
import com.txg.project.utils.SendMail;

@Controller
@RequestMapping(value="/tutor")
public class TutorController implements ApplicationContextAware{

	@Autowired
	private TutorLessonService tutorLessonService;
	
	@Autowired
	private LessonService lessonService;
	
	private ApplicationContext applicationContext;
	
	@RequestMapping(value="/tutor_invite_list")
	public String showTutorInviteList(Model model, HttpSession session) {
		Lecturer lecturer = (Lecturer) session.getAttribute("lecturer");
		List<TutorLesson> tutorInfo= tutorLessonService.findAllTutorLesson(lecturer.getLecturerId());
		
		//List<ClassDict> classDict = lessonService.findUniqueLesson(lecturer.getLecturerId());
		//model.addAttribute("classDict",classDict);
		List<Lesson> lessonList = lessonService.findAllLessons(lecturer.getLecturerId());
		model.addAttribute("lesson", lessonList);		
		
		model.addAttribute("tutorInfo", tutorInfo);
		return "marker_invite";
	}
	
	@Transactional
	@RequestMapping(value="/invite_tutor")
	public String inviteTutor(HttpSession session, Integer subject_id,
			@RequestParam(value="subject", required=false) String subject,
			String email) {
		Lecturer lecturer = (Lecturer) session.getAttribute("lecturer");
		boolean newTutor = false;
		Tutor tutor = tutorLessonService.selectTutorByEmail(email);
		if(tutor == null) {
			//No info yet
			tutor = new Tutor();
			tutor.setTutorEmail(email);
			tutor.setPassword(RandomString.generateUUID());
			tutorLessonService.addTutorInfo(tutor);
			newTutor = true;
		}
		TutorLesson tutorLesson = new TutorLesson();
		Lesson lesson = lessonService.selectLessonById(subject_id);
		tutorLesson.setLesson(lesson);
		tutorLesson.setTutor(tutor);
		tutorLesson.setStatus(UUID.randomUUID().toString());
		Integer result = tutorLessonService.inviteTutor(tutorLesson);
		
		SendMail sMail = new SendMail(lecturer.getLecturerEmail(),email, tutorLesson, newTutor);
		sMail.start();
		return "redirect:/tutor/tutor_invite_list";
		
	}
	
	/*
	@Transactional
	@RequestMapping(value="/invite_tutor")
	public String inviteTutor(HttpSession session,String subject_id,String semester, 
			Integer year, String tutor_email) {
		Lecturer lecturer = (Lecturer) session.getAttribute("lecturer");
		boolean newTutor = false;
		Lesson lesson = new Lesson();
		lesson.setSemester(semester);
		lesson.setYear(year);
		ClassDict classDict = new ClassDict();
		classDict.setClassId(subject_id.split(" ")[0]);
		lesson.setClassDict(classDict);		
		lesson.setLecturer(lecturer);
		Integer id = lessonService.selectLessonByDetail(lesson).getLessonId();
		lesson.setLessonId(id);
		Tutor tutor = tutorLessonService.selectTutorByEmail(tutor_email);
		
		if(tutor == null) {
			//No info yet
			tutor = new Tutor();
			tutor.setTutorEmail(tutor_email);
			tutor.setPassword(RandomString.generateUUID());
			tutorLessonService.addTutorInfo(tutor);
			newTutor = true;
		}
		TutorLesson tutorLesson = new TutorLesson();
		tutorLesson.setLesson(lesson);
		tutorLesson.setTutor(tutor);
		tutorLesson.setStatus(UUID.randomUUID().toString());
		System.out.println(tutor);
		System.out.println(tutorLesson);
		Integer result = tutorLessonService.inviteTutor(tutorLesson);
		
		SendMail sMail = new SendMail(lecturer.getLecturerEmail(),tutor_email, tutorLesson, newTutor);
		sMail.start();
		return "redirect:/tutor/tutor_invite_list";
	}
	*/
	@RequestMapping(value = "/overview")
	public String showActivated(HttpSession session,Model model) {
		Lecturer lecturer = (Lecturer) session.getAttribute("lecturer");
		List<TutorLesson> activatedList = tutorLessonService.findAllActivatedTutorLesson(lecturer.getLecturerId());
		model.addAttribute("activatedList",activatedList);
		List<Lesson> lessonList = lessonService.findAllLessons(lecturer.getLecturerId());
		model.addAttribute("lesson", lessonList);
		return "marker";
	}
	
	@RequestMapping(value="/deleteId")
	@ResponseBody
	public void deleteTutorLesson(Integer tutorLessonId, Model model) {
		Integer result = tutorLessonService.deleteTutorLesson(tutorLessonId);
		if(result == 1) {
			model.addAttribute("operation", true);
			model.addAttribute("msg","Delete Success");
		}else {
			model.addAttribute("operation",false);
			model.addAttribute("msg", "Delete Fail");
		}
	}
	
	@RequestMapping(value="/updateInfo")
	public String updateInfo(Model model, HttpSession session,Integer tutorLessonId,Integer subject_id) {
		Lecturer lecturer = (Lecturer) session.getAttribute("lecturer");
		Lesson lesson = new Lesson();
		lesson.setLessonId(subject_id);
		
		TutorLesson tutorLesson = new TutorLesson();
		tutorLesson.setTutorLessonId(tutorLessonId);
		tutorLesson.setLesson(lesson);
		Integer result = tutorLessonService.updateInfo(tutorLesson);
		if(result == 1) {
			model.addAttribute("operation", true);
			model.addAttribute("msg","Update Success");
		}else {
			model.addAttribute("operation",false);
			model.addAttribute("msg", "Update Fail");
		}
		return "redirect:/tutor/overview";
	}
	
	@Override
	public void setApplicationContext(ApplicationContext arg0) throws BeansException {
		// TODO Auto-generated method stub
		this.applicationContext = arg0;
	}
	
}
