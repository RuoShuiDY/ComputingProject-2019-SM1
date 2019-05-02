package com.txg.project.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.txg.project.domain.ClassDict;

@Repository
public interface ClassDictMapper {

	List<ClassDict> findAll();
}
