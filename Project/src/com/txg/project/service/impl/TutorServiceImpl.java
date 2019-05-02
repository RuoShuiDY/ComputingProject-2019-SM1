package com.txg.project.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.txg.project.domain.Tutor;
import com.txg.project.mapper.TutorMapper;
import com.txg.project.service.TutorService;
@Service
public class TutorServiceImpl implements TutorService {

	@Autowired
	private TutorMapper tutorMapper;
	
	@Override
	public Tutor tutorLogin(String email, String password) {
		// TODO Auto-generated method stub
		Tutor tutor = new Tutor();
		tutor.setTutorEmail(email);
		tutor.setPassword(password);
		return tutorMapper.tutorLogin(tutor);
	}

}
