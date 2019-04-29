package com.txg.project.domain;

public class Lecturer {

	private Integer lecturerId;
	private String lecturerEmail;
	private String lecturerName;
	private String password;
	public Integer getLecturerId() {
		return lecturerId;
	}
	public void setLecturerId(Integer lecturerId) {
		this.lecturerId = lecturerId;
	}
	public String getLecturerEmail() {
		return lecturerEmail;
	}
	public void setLecturerEmail(String lecturerEmail) {
		this.lecturerEmail = lecturerEmail;
	}
	public String getLecturerName() {
		return lecturerName;
	}
	public void setLecturerName(String lecturerName) {
		this.lecturerName = lecturerName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Lecturer [lecturerId=" + lecturerId + ", lecturerEmail=" + lecturerEmail + ", lecturerName="
				+ lecturerName + ", password=" + password + "]";
	}
	
	
}
