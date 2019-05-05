package com.txg.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.txg.project.domain.ClassDict;
import com.txg.project.domain.Lecturer;
import com.txg.project.domain.Lesson;
import com.txg.project.queryDomain.QueryLesson;
import com.txg.project.service.ClassDictService;
import com.txg.project.service.LessonService;

@Controller
@RequestMapping("/lesson")
public class LessonController {

	@Autowired
	private LessonService lessonService;
	@Autowired
	private ClassDictService classDictService;
	
	
	@RequestMapping(value="/lessonlist")
	public String showLessonList(Model model,HttpSession session,QueryLesson query) {
		Lecturer lecturer = (Lecturer) session.getAttribute("lecturer");
		if(lecturer == null) {
			model.addAttribute("msg", "Session expired.");
			return "redirect:/user/loginUI";
		}
		if (query == null) {
			query = new QueryLesson();
		}
		query.setLecturerId(lecturer.getLecturerId());
		List<Lesson> list = lessonService.findAllLessons(query);
		model.addAttribute("lessonlist",list);
		List<ClassDict> classes = classDictService.findAll();
		model.addAttribute("classes", classes);
		return "subject";
	}
	
	@RequestMapping(value = "/addlesson")
	public String addLesson(Model model, Lesson lesson, HttpSession session,
			@RequestParam(value="class_id",required = true)String classId) {
		Lecturer lecturer = (Lecturer) session.getAttribute("lecturer");
		lesson.setLecturer(lecturer);
		
		ClassDict classDict = new ClassDict();
		classDict.setClassId(classId.substring(0,classId.indexOf(' ')));
		lesson.setClassDict(classDict);
		
		//System.out.println(lesson);
		Integer result = lessonService.addLesson(lesson);
		if(result != 0) {
			model.addAttribute("operation",true);
			model.addAttribute("msg", "Insertion Success");		
		}else {
			model.addAttribute("operation",false);
			model.addAttribute("msg", "Insertion fail");
		}
		return "redirect:lessonlist";
	}
	@RequestMapping(value="/deletelesson")
	@ResponseBody
	public void deleteLesson(Model model,
			@RequestParam(value="lesson_id",required=true)Integer lessonId) {
		Integer result = lessonService.deleteLesson(lessonId);
		if(result != 0) 
		{
			model.addAttribute("operation", true);
			model.addAttribute("msg","Delete Success");
		}else {
			model.addAttribute("operation",false);
			model.addAttribute("msg", "Delete Fail");
		}
		//return "forward:lessonlist";
	}
	
}
