package com.txg.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.txg.project.domain.ClassDict;
import com.txg.project.domain.Lesson;
import com.txg.project.mapper.LessonMapper;
import com.txg.project.queryDomain.QueryLesson;
import com.txg.project.service.LessonService;

@Transactional
@Service
public class LessonServiceImpl implements LessonService{

	@Autowired
	private LessonMapper lessonMapper;
	
	/*
	@Override
	public List<Lesson> findAllLessons(QueryLesson query) {
		// TODO Auto-generated method stub
		if(query.getQueryClassId() != null && !query.getQueryClassId().equals("")) {
			String classCombine = query.getQueryClassId(); 			
			query.setQueryClassId("%"+classCombine.substring(0, classCombine.indexOf(" "))+"%");
		}
		return lessonMapper.selectAll(query);
	}*/

	@Override
	public Integer addLesson(Lesson lesson) {
		// TODO Auto-generated method stub
		if(lessonMapper.selectLesson(lesson) != null) {
			return 0;
		}else {
			return lessonMapper.addLesson(lesson);
		}
	}

	@Override
	public Integer deleteLesson(Integer lessonId) {
		// TODO Auto-generated method stub
		return lessonMapper.deleteLesson(lessonId);
	}

	@Override
	public List<Lesson> findAllLessons(Integer lecturer_id) {
		// TODO Auto-generated method stub
		return lessonMapper.selectAllLessons(lecturer_id);
	}

	@Override
	 public Integer updateLesson(Lesson lesson) {
	  // TODO Auto-generated method stub
	  Lesson newLesson = lessonMapper.selectLesson(lesson);
	  System.out.println(newLesson);
	  if(newLesson != null) {
	   return 0;
	  }
	  return lessonMapper.updateLesson(lesson);   
	 }

	@Override
	public List<ClassDict> findUniqueLesson(Integer lecturerId) {
		// TODO Auto-generated method stub
		return lessonMapper.findUniqueLesson(lecturerId);
	}

	@Override
	public Lesson selectLessonByDetail(Lesson lesson) {
		// TODO Auto-generated method stub
		return lessonMapper.selectLesson(lesson);
	}

	@Override
	public Lesson selectLessonById(Integer lessonId) {
		// TODO Auto-generated method stub
		return lessonMapper.selectLessonById(lessonId);
	}

}
