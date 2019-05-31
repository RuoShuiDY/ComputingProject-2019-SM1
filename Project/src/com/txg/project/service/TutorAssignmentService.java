package com.txg.project.service;

import java.util.List;

import com.txg.project.domain.TutorAssignment;

public interface TutorAssignmentService {

	List<TutorAssignment> getAllocationList(Integer lecturerId);

	void addTutorAssignment(TutorAssignment tutorAssignment);

	List<TutorAssignment> findTutorAssignmentByTutorId(Integer tutorId);

	TutorAssignment getTutorAssignmentByDetail(TutorAssignment tutorAssignment);

	void updateExcelFile(TutorAssignment tutorAssignment);

}
