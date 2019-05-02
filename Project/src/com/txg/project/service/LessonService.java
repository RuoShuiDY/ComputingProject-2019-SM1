package com.txg.project.service;

import java.util.List;

import com.txg.project.domain.Lesson;
import com.txg.project.queryDomain.QueryLesson;

public interface LessonService {

	List<Lesson> findAllLessons(QueryLesson query);

	Integer addLesson(Lesson lesson);
}
