package com.txg.project.mapper;

import com.txg.project.domain.Tutor;

public interface MarkerMapper {

	Tutor findMarkerById(Integer id);

	Integer updateMarker(Tutor tutor);
}
