package com.txg.project.service;

import com.txg.project.domain.Lecturer;

public interface LecturerService {

	Lecturer lecturerLogin(String email,String password);
	
}
