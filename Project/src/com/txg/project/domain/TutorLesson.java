package com.txg.project.domain;

public class TutorLesson {

	private Integer tutorLessonId;
	private String status;
	private Lesson lesson;
	private Tutor tutor;
	public Integer getTutorLessonId() {
		return tutorLessonId;
	}
	public void setTutorLessonId(Integer tutorLessonId) {
		this.tutorLessonId = tutorLessonId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Lesson getLesson() {
		return lesson;
	}
	public void setLesson(Lesson lesson) {
		this.lesson = lesson;
	}
	public Tutor getTutor() {
		return tutor;
	}
	public void setTutor(Tutor tutor) {
		this.tutor = tutor;
	}
	@Override
	public String toString() {
		return "TutorLesson [tutorLessonId=" + tutorLessonId + ", status=" + status + ", lesson=" + lesson + ", tutor="
				+ tutor + "]";
	}
	
	
}
