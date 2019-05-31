package com.txg.project.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.txg.project.domain.Lesson;
import com.txg.project.domain.Tutor;
import com.txg.project.domain.TutorLesson;

@Repository
public interface TutorLessonMapper {

	List<TutorLesson> findAll(Integer lecturerId);
	
	Tutor tutorLogin(Tutor tutor);

	Tutor selectTutorByEmail(String email);

	Integer addTutorLesson(TutorLesson tutorLesson);

	Integer addTutor(Tutor tutor);

	List<TutorLesson> findAllActivatedTutorLesson(Integer lecturerId);

	Integer deleteTutorLesson(Integer tutorLessonId);

	Integer updateInfo(TutorLesson tutorLesson);

	List<Lesson> findLessonsByTutorId(Integer id);

	List<TutorLesson> findTutorsByLessonId(Integer lessonId);
	
	List<TutorLesson> findTutorLessonByTutorId(Integer tutorId);

	Tutor findTutorByAckId(String ackNum);

	void acknowledge(String ackNum);
}
