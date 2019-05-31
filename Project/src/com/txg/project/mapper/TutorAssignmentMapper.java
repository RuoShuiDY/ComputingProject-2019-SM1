package com.txg.project.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.txg.project.domain.TutorAssignment;

@Repository
public interface TutorAssignmentMapper {

	List<TutorAssignment> getAllocationList(Integer lecturerId);

	void insertTutorAssignment(TutorAssignment tutorAssignment);

	List<TutorAssignment> findTutorAssignmentByTutorId(Integer tutorId);

	TutorAssignment findTutorAssignmentByDetail(TutorAssignment tutorAssignment);

	void updateExcelFile(TutorAssignment tutorAssignment);

}
