package com.txg.project.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.txg.project.domain.ClassDict;
import com.txg.project.domain.Lesson;
import com.txg.project.queryDomain.QueryLesson;

@Repository
public interface LessonMapper {
	/*
	List<Lesson> selectAll(QueryLesson query);
	*/
	Integer addLesson(Lesson lesson);
	
	Lesson selectLesson(Lesson lesson);
	
	Integer deleteLesson(Integer lessonId);

	List<Lesson> selectAllLessons(Integer lecturer_id);
	
	Integer updateLesson(Lesson lesson);

	List<ClassDict> findUniqueLesson(Integer lecturerId);
}
