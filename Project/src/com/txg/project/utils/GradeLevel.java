package com.txg.project.utils;

public class GradeLevel {

	public static Integer getGradeLevel(Float proportion) {
		if(proportion>=0.799) {
			return 0;
		}else if(proportion>=0.7499) {
			return 1;
		}else if(proportion>=0.699) {
			return 2;
		}else if(proportion>=0.6499) {
			return 3;
		}else if(proportion>=0.499) {
			return 4;
		}else if(proportion>=0) {
			return 5;
		}else {
			return 6;
		}
	}
}
