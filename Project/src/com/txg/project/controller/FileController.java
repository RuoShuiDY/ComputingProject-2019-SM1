package com.txg.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.set.ListOrderedSet;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.txg.project.domain.Lesson;
import com.txg.project.domain.Mark;
import com.txg.project.domain.Student;
import com.txg.project.domain.Tutor;
import com.txg.project.domain.TutorAssignment;
import com.txg.project.domain.TutorLesson;
import com.txg.project.service.MarkService;
import com.txg.project.service.TutorAssignmentService;
import com.txg.project.service.TutorLessonService;
import com.txg.project.utils.ExcelUtils;

@Controller
@RequestMapping(value="file")
public class FileController {

	@Autowired
	private TutorLessonService tutorLessonService;
	@Autowired
	private TutorAssignmentService tutorAssignmentService;
	@Autowired
	private MarkService markService;
	
	@RequestMapping(value="downloadUI")
	public String downloadUI(HttpSession session, Model model) {
		Tutor tutor = (Tutor) session.getAttribute("tutor");
		
		List<Lesson> lessons = tutorLessonService.findLessonsByTutorId(tutor.getTutorId());
		
		List<TutorAssignment> tutorAssignments = tutorAssignmentService.findTutorAssignmentByTutorId(tutor.getTutorId());
		
		model.addAttribute("lessons", lessons);
		model.addAttribute("tutorAssignments", tutorAssignments);
		return "download_spreadsheet";
	}
	@RequestMapping(value="downloadFile")
	public String findFile(HttpServletRequest request, String subject, String assignment, Model model) {
		Tutor tutor = (Tutor) request.getSession().getAttribute("tutor");
		String path = request.getServletContext().getRealPath("download");
		subject = subject.substring(subject.indexOf(" ")+1, subject.length());
		path = path+"/"+subject;
        File file = new File(path+"/"+tutor.getTutorName()+" assign"+assignment+".xlsx");
        System.out.println(path+"/"+tutor.getTutorName()+" assign"+assignment+".xlsx");
        if(!file.exists()) {
        	model.addAttribute("operation", false);
        	model.addAttribute("msg", "No such assignment");
        	return "redirect:downloadUI";
        }else {
        	return "forward:download";
        }
	}
	@RequestMapping(value="download")
	public ResponseEntity<byte[]> download(HttpServletRequest request,String subject, String assignment,
            Model model) throws IOException{
        Tutor tutor = (Tutor) request.getSession().getAttribute("tutor");
		String path = request.getServletContext().getRealPath("download");
		subject = subject.substring(subject.indexOf(" ")+1, subject.length());
		path = path+"/"+subject;
		File file = new File(path+"/"+tutor.getTutorName()+" assign"+assignment+".xlsx");
        
        HttpHeaders headers = new HttpHeaders();//http头信息
        
        String downloadFileName = tutor.getTutorName()+" assign"+assignment+".xlsx";
        
        headers.setContentDispositionFormData("attachment", downloadFileName);
        
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        
        //MediaType:互联网媒介类型  contentType：具体请求中的媒体类型信息
        
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers,HttpStatus.CREATED);
        
    }
	@RequestMapping(value="uploadUI")
	public String uploadUI(HttpSession session, Model model) {
		Tutor tutor = (Tutor) session.getAttribute("tutor");
		
		List<TutorLesson> tutorlessons = tutorLessonService.findTutorLessonByTutorId(tutor.getTutorId());
		List<TutorAssignment> tutorAssignments = tutorAssignmentService.findTutorAssignmentByTutorId(tutor.getTutorId());
		
		model.addAttribute("tutorLesson", tutorlessons);
		model.addAttribute("tutorAssignments", tutorAssignments);
		return "upload_spreadsheet";
	} 
	@Transactional
	@RequestMapping(value = "/upload")
	public String allocate(Model model, HttpServletRequest request, Integer tutorLessonId, 
			Integer assignment, MultipartFile markExcel) throws Exception {
		TutorAssignment tutorAssignment = new TutorAssignment();
		tutorAssignment.setAssignment(assignment);
		TutorLesson tutorLesson = new TutorLesson();
		tutorLesson.setTutorLessonId(tutorLessonId);
		tutorAssignment.setTutorLesson(tutorLesson);
		
		tutorAssignment = tutorAssignmentService.getTutorAssignmentByDetail(tutorAssignment);
		if(tutorAssignment.getMarkExcel()!= null) {
			return "redirect:uploadUI";
		}
		
		if(markExcel == null) {
			return "redirect:uploadUI";
		}
		String rootPath = request.getServletContext().getRealPath("marks");
		String oName = markExcel.getOriginalFilename();
		String fileName = UUID.randomUUID().toString().replaceAll("-", "");
		String suffix = oName.substring(oName.lastIndexOf(".") + 1);
		File file = new File(rootPath);
		if(!file.exists()) {
			file.mkdir();
		}
		File excelFile = new File(rootPath+"/"+fileName +"."+ suffix);
		markExcel.transferTo(excelFile);
		List<Mark> marks = new ExcelUtils().getExcelMark(excelFile.getAbsolutePath(), tutorAssignment.getTutorAssignmentId());
		
		Integer stuNum = markService.findCountByTutorAssignmentId(tutorAssignment.getTutorAssignmentId());
		if(stuNum != marks.size()) {
			return "redirect:uploadUI";
		}
		
		for(Mark mark: marks) {
			//Update mark
			markService.updateMarkDetails(mark);
		}
		tutorAssignment.setMarkExcel(excelFile.getAbsolutePath());
		tutorAssignmentService.updateExcelFile(tutorAssignment);
		
		model.addAttribute("operation", true);
		model.addAttribute("msg", "Update Successfully");
		
		return "redirect:uploadUI";
	}
}
