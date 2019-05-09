package com.txg.project.service;

import java.util.List;

import com.txg.project.domain.ClassDict;
import com.txg.project.domain.Lesson;

public interface LessonService {

	/*
	List<Lesson> findAllLessons(QueryLesson queryLesson);
	*/
	List<Lesson> findAllLessons(Integer lecturer_id);

	Integer addLesson(Lesson lesson);
	
	Integer deleteLesson(Integer lessonId);
	
	Integer updateLesson(Lesson lesson);

	List<ClassDict> findUniqueLesson(Integer lecturerId);
	
	Lesson selectLessonByDetail(Lesson lesson);
}
