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
	public Lecturer lecturerLogin(Lecturer lecturer) {
		// TODO Auto-generated method stub
		return lecturerMapper.lecturerLogin(lecturer);
	}
	
	
	
}
