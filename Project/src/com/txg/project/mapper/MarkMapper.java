package com.txg.project.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.txg.project.domain.Mark;
import com.txg.project.queryDomain.QueryMark;
import com.txg.project.queryDomain.QueryMarkDomain;

@Repository
public interface MarkMapper {

	void insertMarks(Mark mark);

	Integer findCountByTutorAssignmentId(Integer tutorAssignmentId);

	void updateMarkDetails(Mark mark);

	List<QueryMarkDomain> findAllMarks(QueryMark queryMark);

	Integer updateMarkDomain(QueryMarkDomain queryMarkDomain);

	List<QueryMarkDomain> findMarksByIds(Integer[] mkids);
}
