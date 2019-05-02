package com.txg.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.txg.project.domain.ClassDict;
import com.txg.project.mapper.ClassDictMapper;
import com.txg.project.service.ClassDictService;
@Service
public class ClassDictServiceImpl implements ClassDictService {

	@Autowired
	private ClassDictMapper classDictMapper;
	
	@Override
	public List<ClassDict> findAll() {
		// TODO Auto-generated method stub
		return classDictMapper.findAll();
	}

}
