package com.txg.project.queryDomain;

public class QueryMarkDomain {

	private Integer markId;
	private String classId;
	private String semester;
	private Integer year;
	private String tutorEmail;
	private Integer studentId;
	private String studentEmail;
	private String studentUsername;
	private String studentSurname;
	private String studentGivenname;
	private Integer assignment;
	private Float marks;
	private Float maxMark;
	private String comment;
	public Integer getMarkId() {
		return markId;
	}
	public void setMarkId(Integer markId) {
		this.markId = markId;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public String getTutorEmail() {
		return tutorEmail;
	}
	public void setTutorEmail(String tutorEmail) {
		this.tutorEmail = tutorEmail;
	}
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public String getStudentEmail() {
		return studentEmail;
	}
	public void setStudentEmail(String studentEmail) {
		this.studentEmail = studentEmail;
	}
	public String getStudentUsername() {
		return studentUsername;
	}
	public void setStudentUsername(String studentUsername) {
		this.studentUsername = studentUsername;
	}
	public String getStudentSurname() {
		return studentSurname;
	}
	public void setStudentSurname(String studentSurname) {
		this.studentSurname = studentSurname;
	}
	public String getStudentGivenname() {
		return studentGivenname;
	}
	public void setStudentGivenname(String studentGivenname) {
		this.studentGivenname = studentGivenname;
	}
	public Integer getAssignment() {
		return assignment;
	}
	public void setAssignment(Integer assignment) {
		this.assignment = assignment;
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
	@Override
	public String toString() {
		return "QueryMarkDomain [markId=" + markId + ", classId=" + classId + ", semester=" + semester + ", year="
				+ year + ", tutorEmail=" + tutorEmail + ", studentId=" + studentId + ", studentEmail=" + studentEmail
				+ ", studentUsername=" + studentUsername + ", studentSurname=" + studentSurname + ", studentGivenname="
				+ studentGivenname + ", assignment=" + assignment + ", marks=" + marks + ", maxMark=" + maxMark
				+ ", comment=" + comment + "]";
	}
	
	
}
