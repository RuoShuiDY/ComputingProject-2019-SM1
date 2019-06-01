package com.txg.project.controller;

import java.util.ArrayList;
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
import com.txg.project.utils.GradeLevel;

@Controller
@RequestMapping("/mark")
public class MarkController {

	@Autowired
	private MarkService markService;
	@Autowired
	private LessonService lessonService;

	@RequestMapping(value = "list")
	public String markList(HttpSession session, Model model, Integer lessonId, Integer assignment) {
		Lecturer lecturer = (Lecturer) session.getAttribute("lecturer");
		QueryMark queryMark = new QueryMark();
		queryMark.setLecturerId(lecturer.getLecturerId());
		if (lessonId != null) {
			queryMark.setLessonId(lessonId);
		} else {
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
	public String updateMark(Integer mark_id, Model model, Float mark, String comment) {
		QueryMarkDomain queryMarkDomain = new QueryMarkDomain();
		queryMarkDomain.setMarkId(mark_id);
		queryMarkDomain.setMarks(mark);
		queryMarkDomain.setComment(comment);
		Integer result = markService.updateMarkDomain(queryMarkDomain);
		if(result == 0) {
			model.addAttribute("operation", false);
			model.addAttribute("msg", "Update fail");
			
		}else {
			model.addAttribute("operation", true);
        	model.addAttribute("msg", "Update Successfully");
		}
		return "redirect:list";

	}

	@ResponseBody
	@RequestMapping("sendEmails")
	public void sendEmails(@RequestParam(value = "mkids[]") Integer[] mkids) {
		markService.sendEmailsStudents(mkids);
	}

	@RequestMapping("showChart")
	public String showChart(HttpSession session, Model model, Integer lessonId, Integer assignment) {
		Lecturer lecturer = (Lecturer) session.getAttribute("lecturer");
		QueryMark queryMark = new QueryMark();
		queryMark.setLecturerId(lecturer.getLecturerId());
		if (lessonId != null) {
			queryMark.setLessonId(lessonId);
		} else {
			Calendar calendar = Calendar.getInstance();
			queryMark.setYear(calendar.get(Calendar.YEAR));
		}
		if (assignment != null) {
			queryMark.setAssignment(assignment);
		}
		List<QueryMarkDomain> marks = markService.findAllMarks(queryMark);

		List<Lesson> lessons = lessonService.findAllLessons(lecturer.getLecturerId());	/////////

		//Line chart
		ArrayList<Integer> assignList = new ArrayList<Integer>();
		for(QueryMarkDomain qmd: marks) {
			boolean flag = true;
			for(Integer i:assignList) {
				if(qmd.getAssignment() == i) {
					flag = false;
					break;
				}
			}
			if(flag) {
				assignList.add(qmd.getAssignment());				
			}
		}
		ArrayList<Integer[]> numbers= new ArrayList<Integer[]>();
		for(int i=0;i<assignList.size();i++) {
			Integer[] num = new Integer[7];
			for(int j=0;j<7;j++) {
				num[j] = new Integer(0);
			}
			numbers.add(num);
		}
		for(QueryMarkDomain qmd:marks) {
			Integer assign = qmd.getAssignment();
			Float mark = qmd.getMarks();
			Float maxMark = qmd.getMaxMark();
			Float proportion = (float) -1;
			if (mark != null) {
				proportion = mark / maxMark;
			}
			Integer level = GradeLevel.getGradeLevel(proportion);
			Integer assignIndex = assignList.indexOf(assign);
			numbers.get(assignIndex)[level] ++;
		}
		model.addAttribute("assignList", assignList);
		model.addAttribute("numbers", numbers);
		
		
		Integer[] combined = new Integer[7];
		for(int i=0;i<7;i++) {
			combined[i] = new Integer(0);
		}
		for(Integer[] is:numbers) {
			for(int i=0;i<7;i++) {
				combined[i] += is[i];
			}
		}
		
		model.addAttribute("combined", combined);
		model.addAttribute("lessons", lessons);
		model.addAttribute("number", Math.ceil((int)marks.size()*1.0/assignList.size()));
		//model.addAttribute("number", uniqueStudentId.size());
		return "score_charts";
	}
}
