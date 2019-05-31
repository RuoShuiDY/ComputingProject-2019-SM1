package com.txg.project.utils;

public class GradeLevel {

	public static Integer getGradeLevel(Float proportion) {
		if(proportion>=0.8) {
			return 0;
		}else if(proportion>=0.75) {
			return 1;
		}else if(proportion>=0.7) {
			return 2;
		}else if(proportion>=0.65) {
			return 3;
		}else if(proportion>=0.5) {
			return 4;
		}else if(proportion>=0) {
			return 5;
		}else {
			return 6;
		}
	}
}
