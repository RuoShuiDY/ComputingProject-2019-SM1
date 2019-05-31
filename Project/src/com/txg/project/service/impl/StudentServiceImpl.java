package com.txg.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.txg.project.domain.Student;
import com.txg.project.mapper.StudentMapper;
import com.txg.project.service.StudentService;

@Transactional
@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentMapper studentMapper;
	
	@Override
	public void InsertOrUpdate(List<Student> list) {
		// TODO Auto-generated method stub
		for(Student student : list) {
			if(studentMapper.selectStudentById(student.getStudentId()) == null) {
				studentMapper.insertStudent(student);
			}else {
				studentMapper.updateStudent(student);
			}
		}
	}

}
