package com.txg.project.mapper;

import org.springframework.stereotype.Repository;

import com.txg.project.domain.Student;

@Repository
public interface StudentMapper {

	void insertStudent(Student student);
	
	void updateStudent(Student student);
	
	Student selectStudentById(Integer studentId);
}
