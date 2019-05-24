package com.txg.project.service;

import com.txg.project.domain.Tutor;

public interface MarkerService {

	Tutor findMarkerById(Integer id);

	Integer updateMarker(Tutor tutor);
}
