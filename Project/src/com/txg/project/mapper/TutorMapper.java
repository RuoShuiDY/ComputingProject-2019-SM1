package com.txg.project.mapper;

import org.springframework.stereotype.Repository;

import com.txg.project.domain.Tutor;

@Repository
public interface TutorMapper {

	Tutor tutorLogin(Tutor tutor);
}
