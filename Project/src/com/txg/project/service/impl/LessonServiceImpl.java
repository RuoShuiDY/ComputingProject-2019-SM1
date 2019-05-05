package com.txg.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.txg.project.domain.Lesson;
import com.txg.project.mapper.LessonMapper;
import com.txg.project.queryDomain.QueryLesson;
import com.txg.project.service.LessonService;

@Service
public class LessonServiceImpl implements LessonService{

	@Autowired
	private LessonMapper lessonMapper;
	
	@Override
	public List<Lesson> findAllLessons(QueryLesson query) {
		// TODO Auto-generated method stub
		if(query.getQueryClassId() != null && !query.getQueryClassId().equals("")) {
			String classCombine = query.getQueryClassId(); 			
			query.setQueryClassId("%"+classCombine.substring(0, classCombine.indexOf(" "))+"%");
		}
		return lessonMapper.selectAll(query);
	}

	@Override
	public Integer addLesson(Lesson lesson) {
		// TODO Auto-generated method stub
		if(lessonMapper.selectLesson(lesson)>0) {
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

}
