package com.txg.project.domain;

public class Mark {

	private Integer markId;
	private Float marks;
	private Float maxMark;
	private String comment;
	
	private TutorAssignment tutorAssignment;
	private Student student;
	public Integer getMarkId() {
		return markId;
	}
	public void setMarkId(Integer markId) {
		this.markId = markId;
	}
	public Float getMarks() {
		return marks;
	}
	public void setMarks(Float marks) {
		this.marks = marks;
	}
	public Float getMaxMark() {
		return maxMark;
	}
	public void setMaxMark(Float maxMark) {
		this.maxMark = maxMark;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public TutorAssignment getTutorAssignment() {
		return tutorAssignment;
	}
	public void setTutorAssignment(TutorAssignment tutorAssignment) {
		this.tutorAssignment = tutorAssignment;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
	
}
