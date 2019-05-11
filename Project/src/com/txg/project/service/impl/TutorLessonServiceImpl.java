package com.txg.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.txg.project.domain.Tutor;
import com.txg.project.domain.TutorLesson;
import com.txg.project.mapper.TutorLessonMapper;
import com.txg.project.service.TutorLessonService;

@Transactional
@Service
public class TutorLessonServiceImpl implements TutorLessonService {

	@Autowired
	private TutorLessonMapper tutorLessonMapper;
	
	@Override
	public List<TutorLesson> findAllTutorLesson(Integer lecturerId) {
		// TODO Auto-generated method stub
		return tutorLessonMapper.findAll(lecturerId);
	}
	@Override
	public Tutor tutorLogin(String email, String password) {
		// TODO Auto-generated method stub
		Tutor tutor = new Tutor();
		tutor.setTutorEmail(email);
		tutor.setPassword(password);
		return tutorLessonMapper.tutorLogin(tutor);
	}
	@Override
	public Tutor selectTutorByEmail(String email) {
		// TODO Auto-generated method stub
		return tutorLessonMapper.selectTutorByEmail(email);
	}
	@Override
	public Integer inviteTutor(TutorLesson tutorLesson) {
		// TODO Auto-generated method stub
		return tutorLessonMapper.addTutorLesson(tutorLesson);
	}
	@Override
	public Integer addTutorInfo(Tutor tutor) {
		// TODO Auto-generated method stub
		return tutorLessonMapper.addTutor(tutor);
	}
	@Override
	public List<TutorLesson> findAllActivatedTutorLesson(Integer lecturerId) {
		// TODO Auto-generated method stub
		return tutorLessonMapper.findAllActivatedTutorLesson(lecturerId);
	}
	@Override
	public Integer deleteTutorLesson(Integer tutorLessonId) {
		// TODO Auto-generated method stub
		return tutorLessonMapper.deleteTutorLesson(tutorLessonId);
	}
	@Override
	public Integer updateInfo(TutorLesson tutorLesson) {
		// TODO Auto-generated method stub
		return tutorLessonMapper.updateInfo(tutorLesson);
	}

}
