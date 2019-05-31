package com.txg.project.domain;

public class Student {

	private Integer studentId;
	private String studentEmail;
	private String studentUsername;
	private String studentSurname;
	private String studentGivenname;
	
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
	@Override
	public String toString() {
		return "Student [studentId=" + studentId + ", studentEmail=" + studentEmail + ", studentUsername="
				+ studentUsername + ", studentSurname=" + studentSurname + ", studentGivenname=" + studentGivenname
				+ "]";
	}
	
	
}
