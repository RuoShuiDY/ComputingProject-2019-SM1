package com.txg.project.mapper;

import org.springframework.stereotype.Repository;

import com.txg.project.domain.Lecturer;

@Repository
public interface LecturerMapper {

	Lecturer lecturerLogin(Lecturer lecturer);
}
