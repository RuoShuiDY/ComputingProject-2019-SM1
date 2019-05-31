package com.txg.project.domain;

public class TutorAssignment {

	Integer tutorAssignmentId;
	TutorLesson tutorLesson;
	Integer assignment;
	String markExcel;
	public Integer getTutorAssignmentId() {
		return tutorAssignmentId;
	}
	public void setTutorAssignmentId(Integer tutorAssignmentId) {
		this.tutorAssignmentId = tutorAssignmentId;
	}
	
	public TutorLesson getTutorLesson() {
		return tutorLesson;
	}
	public void setTutorLesson(TutorLesson tutorLesson) {
		this.tutorLesson = tutorLesson;
	}
	public Integer getAssignment() {
		return assignment;
	}
	public void setAssignment(Integer assignment) {
		this.assignment = assignment;
	}
	public void setMarkExcel(String markExcel) {
		this.markExcel = markExcel;
	}
	public String getMarkExcel() {
		return markExcel;
	}
	
}
