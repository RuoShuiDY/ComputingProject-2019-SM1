package com.txg.project.domain;

public class Lesson {

	private Integer lessonId;
	private String semester;
	private Integer year;
	private String state;
	
	private ClassDict classDict;
	private Lecturer lecturer;
	public Integer getLessonId() {
		return lessonId;
	}
	public void setLessonId(Integer lessonId) {
		this.lessonId = lessonId;
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
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public ClassDict getClassDict() {
		return classDict;
	}
	public void setClassDict(ClassDict classDict) {
		this.classDict = classDict;
	}
	public Lecturer getLecturer() {
		return lecturer;
	}
	public void setLecturer(Lecturer lecturer) {
		this.lecturer = lecturer;
	}
	@Override
	public String toString() {
		return "Lesson [lessonId=" + lessonId + ", semester=" + semester + ", year=" + year + ", state=" + state
				+ ", classDict=" + classDict + ", lecturer=" + lecturer + "]";
	}

	
	
	
}
