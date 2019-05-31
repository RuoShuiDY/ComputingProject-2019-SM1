package com.txg.project.service;

import java.util.List;

import com.txg.project.domain.Mark;
import com.txg.project.queryDomain.QueryMark;
import com.txg.project.queryDomain.QueryMarkDomain;

public interface MarkService {

	void insertMarks(List<Mark> marks);

	Integer findCountByTutorAssignmentId(Integer tutorAssignmentId);

	void updateMarkDetails(Mark mark);

	List<QueryMarkDomain> findAllMarks(QueryMark queryMark);

	Integer updateMarkDomain(QueryMarkDomain queryMarkDomain);

	void sendEmailsStudents(Integer[] mkids);
}
