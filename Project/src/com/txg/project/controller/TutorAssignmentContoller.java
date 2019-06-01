package com.txg.project.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.txg.project.domain.Lecturer;
import com.txg.project.domain.Lesson;
import com.txg.project.domain.Mark;
import com.txg.project.domain.Student;
import com.txg.project.domain.TutorAssignment;
import com.txg.project.domain.TutorLesson;
import com.txg.project.service.LessonService;
import com.txg.project.service.MarkService;
import com.txg.project.service.StudentService;
import com.txg.project.service.TutorAssignmentService;
import com.txg.project.service.TutorLessonService;
import com.txg.project.utils.ExcelUtils;

@Controller
@RequestMapping("/assign")
public class TutorAssignmentContoller {

	@Autowired
	private TutorAssignmentService tutorAssignmentService;
	@Autowired
	private LessonService lessonService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private TutorLessonService tutorLessonService;
	@Autowired
	private MarkService markService;
	
	@RequestMapping(value = "/list")
	public String showList(HttpSession session, Model model) {
		Lecturer lecturer = (Lecturer) session.getAttribute("lecturer");
		List<TutorAssignment> list = tutorAssignmentService.getAllocationList(lecturer.getLecturerId());
		model.addAttribute("allocationList", list);
		List<Lesson> lessons = lessonService.findAllLessons(lecturer.getLecturerId());
		model.addAttribute("lesson", lessons);
		return "allocation";
	}
	
	@Transactional
	@RequestMapping(value = "/allocate")
	public String allocate(HttpSession session, Model model, HttpServletRequest request, 
			Integer lessonId, Integer assignment, MultipartFile stuExcel) throws Exception {
		if(stuExcel == null) {
			model.addAttribute("operation", false);
        	model.addAttribute("msg", "No excel upload");
			return "redirect:list";
		}
		String rootPath = request.getServletContext().getRealPath("upload");
		String oName = stuExcel.getOriginalFilename();
		String fileName = UUID.randomUUID().toString().replaceAll("-", "");
		String suffix = oName.substring(oName.lastIndexOf(".") + 1);
		File file = new File(rootPath);
		if(!file.exists()) {
			file.mkdir();
		}
		File excelFile = new File(rootPath+"/"+fileName +"."+ suffix);
		stuExcel.transferTo(excelFile);
		List<Student> list = new ExcelUtils().getExcelStudent(excelFile.getAbsolutePath());
		if(list == null) {
			model.addAttribute("operation", false);
        	model.addAttribute("msg", "Excel Fault");
			return "redirect:list";
		}
		Collections.shuffle(list);
		studentService.InsertOrUpdate(list);
		List<TutorLesson> tutorLessons = tutorLessonService.findTutorsByLessonId(lessonId);
		
		Integer stuNum = (int) Math.ceil(list.size()*1.0 / tutorLessons.size());
		
		List<Mark> marks = new ArrayList<Mark>();
		
		String downloadPath = request.getServletContext().getRealPath("download");
		String[] titles = {"Student Id","Surname","Given Name", "Email", "Username", 
				"Marker Comments", "Score", "Total Score", "Marker"};
	
		int i = 1;
		for(TutorLesson tutorLesson:tutorLessons) {
			TutorAssignment ts = new TutorAssignment();
			ts.setTutorLesson(tutorLesson);
			ts.setAssignment(assignment);
			//tutorAssignments.add(ts);
			tutorAssignmentService.addTutorAssignment(ts);
			
			List<List<String>> content = new ArrayList<List<String>>();
			for (;i<=list.size();i++) {
				List<String> l = new ArrayList<String>();
				String id = list.get(i-1).getStudentId().toString();
				String surname = list.get(i-1).getStudentSurname();
				String givenName = list.get(i-1).getStudentGivenname();
				String email = list.get(i-1).getStudentEmail();
				String username = list.get(i-1).getStudentUsername();
				
				l.add(id);
				l.add(surname);
				l.add(givenName);
				l.add(email);
				l.add(username);
				content.add(l);
				
				Mark mark = new Mark();
				mark.setStudent(list.get(i-1));
				mark.setTutorAssignment(ts);
				marks.add(mark);
				
				if(i%stuNum == 0) {
					i++;
					break;
				}
				
			}
			String path = downloadPath+"/"+tutorLesson.getLesson().getClassDict().getClassName()+"-"
					+tutorLesson.getLesson().getSemester()+"-"+tutorLesson.getLesson().getYear();
			File download = new File(path);
			if (!download.exists()) {
				download.mkdirs();
			}
			String f= path+"/"+tutorLesson.getTutor().getTutorName()+" assign"+assignment +".xlsx";
			new ExcelUtils().createExcel(f, "Marking", titles, content);
			
		}

		markService.insertMarks(marks);
		
		return "redirect:list";
	}
}
