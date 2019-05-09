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
		
		List<ClassDict> classDict = lessonService.findUniqueLesson(lecturer.getLecturerId());
		model.addAttribute("classDict",classDict);
		
		for(ClassDict dict:classDict) {
			System.out.println(dict);
		}
		
		model.addAttribute("tutorInfo", tutorInfo);
		return "tutor_invite";
	}
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
	@Override
	public void setApplicationContext(ApplicationContext arg0) throws BeansException {
		// TODO Auto-generated method stub
		this.applicationContext = arg0;
	}
	
}
