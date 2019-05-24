package com.txg.project.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.txg.project.domain.Tutor;
import com.txg.project.mapper.MarkerMapper;
import com.txg.project.service.MarkerService;

@Service
public class MarkerServiceImpl implements MarkerService {

	@Autowired
	private MarkerMapper markerMapper;
	
	@Override
	public Tutor findMarkerById(Integer id) {
		// TODO Auto-generated method stub
		return markerMapper.findMarkerById(id);
	}

	@Override
	public Integer updateMarker(Tutor tutor) {
		// TODO Auto-generated method stub
		return markerMapper.updateMarker(tutor);
	}

}
