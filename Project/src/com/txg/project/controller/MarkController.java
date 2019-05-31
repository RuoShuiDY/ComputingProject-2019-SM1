package com.txg.project.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.txg.project.domain.Lecturer;
import com.txg.project.domain.Lesson;
import com.txg.project.queryDomain.QueryMark;
import com.txg.project.queryDomain.QueryMarkDomain;
import com.txg.project.service.LessonService;
import com.txg.project.service.MarkService;

@Controller
@RequestMapping("/mark")
public class MarkController {

	@Autowired
	private MarkService markService;
	@Autowired
	private LessonService lessonService;
	
	
	@RequestMapping(value="list")
	public String markList(HttpSession session, Model model, Integer lessonId, Integer assignment) {
		Lecturer lecturer = (Lecturer) session.getAttribute("lecturer");
		QueryMark queryMark = new QueryMark();
		queryMark.setLecturerId(lecturer.getLecturerId());
		if(lessonId != null) {
			queryMark.setLessonId(lessonId);
		}else {
			Calendar calendar = Calendar.getInstance();
			queryMark.setYear(calendar.get(Calendar.YEAR));			
		}
		if (assignment != null) {
			queryMark.setAssignment(assignment);
		}
		List<QueryMarkDomain> marks = markService.findAllMarks(queryMark);
		
		List<Lesson> lessons = lessonService.findAllLessons(lecturer.getLecturerId());
		
		model.addAttribute("marks", marks);
		model.addAttribute("lessons", lessons);
		model.addAttribute("number", marks.size());
		return "results";
	}
	
	@RequestMapping("update")
	public String updateMark(Integer mark_id,Float mark,String comment) {
		QueryMarkDomain queryMarkDomain = new QueryMarkDomain();
		queryMarkDomain.setMarkId(mark_id);
		queryMarkDomain.setMarks(mark);
		queryMarkDomain.setComment(comment);
		Integer result = markService.updateMarkDomain(queryMarkDomain);
		return "redirect:list";
		
	}
	
	@ResponseBody
	@RequestMapping("sendEmails")
	public void sendEmails(@RequestParam(value = "mkids[]") Integer[] mkids) {
		markService.sendEmailsStudents(mkids);
	}
}
