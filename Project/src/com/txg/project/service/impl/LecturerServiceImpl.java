package com.txg.project.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.txg.project.domain.Lecturer;
import com.txg.project.mapper.LecturerMapper;
import com.txg.project.service.LecturerService;

@Service
public class LecturerServiceImpl implements LecturerService{
	@Autowired
	private LecturerMapper lecturerMapper;

	@Override
	public Lecturer lecturerLogin(String email, String password) {
		// TODO Auto-generated method stub
		Lecturer lecturer = new Lecturer();
		try {
			lecturer.setLecturerEmail(email);
			lecturer.setPassword(password);
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
		return lecturerMapper.lecturerLogin(lecturer);
	}
	
	
	
}
