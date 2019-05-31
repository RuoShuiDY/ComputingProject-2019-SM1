package com.txg.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.txg.project.domain.TutorAssignment;
import com.txg.project.mapper.TutorAssignmentMapper;
import com.txg.project.service.TutorAssignmentService;

@Service
public class TutorAssignmentServiceImpl implements TutorAssignmentService {

	@Autowired
	private TutorAssignmentMapper tutorAssignmentMapper;

	@Override
	public List<TutorAssignment> getAllocationList(Integer lecturerId) {
		// TODO Auto-generated method stub
		return tutorAssignmentMapper.getAllocationList(lecturerId);
	}

	@Override
	public void addTutorAssignment(TutorAssignment tutorAssignment) {
		// TODO Auto-generated method stub

		tutorAssignmentMapper.insertTutorAssignment(tutorAssignment);

	}

	@Override
	public List<TutorAssignment> findTutorAssignmentByTutorId(Integer tutorId) {
		// TODO Auto-generated method stub
		return tutorAssignmentMapper.findTutorAssignmentByTutorId(tutorId);
	}

	@Override
	public TutorAssignment getTutorAssignmentByDetail(TutorAssignment tutorAssignment) {
		// TODO Auto-generated method stub
		return tutorAssignmentMapper.findTutorAssignmentByDetail(tutorAssignment);
	}

	@Override
	public void updateExcelFile(TutorAssignment tutorAssignment) {
		// TODO Auto-generated method stub
		tutorAssignmentMapper.updateExcelFile(tutorAssignment);
	}

}
