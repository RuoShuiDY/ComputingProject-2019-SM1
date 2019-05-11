package com.txg.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.txg.project.domain.Tutor;
import com.txg.project.domain.TutorLesson;

@Service
public interface TutorLessonService {

	List<TutorLesson> findAllTutorLesson(Integer lecturerId);
	
	Tutor tutorLogin(String email,String password);
	
	Tutor selectTutorByEmail(String email);

	Integer inviteTutor(TutorLesson tutorLesson);

	Integer addTutorInfo(Tutor tutor);

	List<TutorLesson> findAllActivatedTutorLesson(Integer lecturerId);

	Integer deleteTutorLesson(Integer tutorLessonId);

	Integer updateInfo(TutorLesson tutorLesson);
}
