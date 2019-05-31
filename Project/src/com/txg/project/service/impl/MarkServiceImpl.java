package com.txg.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.txg.project.domain.Mark;
import com.txg.project.mapper.MarkMapper;
import com.txg.project.queryDomain.QueryMark;
import com.txg.project.queryDomain.QueryMarkDomain;
import com.txg.project.service.MarkService;
import com.txg.project.utils.SendMarkMail;

@Service
public class MarkServiceImpl implements MarkService{

	@Autowired
	private MarkMapper markMapper;
	
	@Override
	public void insertMarks(List<Mark> marks) {
		// TODO Auto-generated method stub
		for(Mark mark: marks) {
			markMapper.insertMarks(mark);			
		}
	}

	@Override
	public Integer findCountByTutorAssignmentId(Integer tutorAssignmentId) {
		// TODO Auto-generated method stub
		return markMapper.findCountByTutorAssignmentId(tutorAssignmentId);
	}

	@Override
	public void updateMarkDetails(Mark mark) {
		// TODO Auto-generated method stub
		markMapper.updateMarkDetails(mark);
	}

	@Override
	public List<QueryMarkDomain> findAllMarks(QueryMark queryMark) {
		// TODO Auto-generated method stub
		return markMapper.findAllMarks(queryMark);
	}

	@Override
	public Integer updateMarkDomain(QueryMarkDomain queryMarkDomain) {
		// TODO Auto-generated method stub
		return markMapper.updateMarkDomain(queryMarkDomain);
	}

	@Override
	public void sendEmailsStudents(Integer[] mkids) {
		// TODO Auto-generated method stub
		List<QueryMarkDomain> marks = markMapper.findMarksByIds(mkids);
		for(QueryMarkDomain queryMarkDomain: marks) {
			new SendMarkMail(queryMarkDomain).start();
		}
	}


}
