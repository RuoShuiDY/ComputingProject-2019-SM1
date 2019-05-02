package com.txg.project.queryDomain;

public class QueryLesson {

	private String queryClassId;
	private String querySemester;
	private String queryYear;
	private Integer lecturerId;
	public String getQueryClassId() {
		return queryClassId;
	}
	public void setQueryClassId(String queryClassId) {
		this.queryClassId = queryClassId;
	}
	public String getQuerySemester() {
		return querySemester;
	}
	public void setQuerySemester(String querySemester) {
		this.querySemester = querySemester;
	}
	public String getQueryYear() {
		return queryYear;
	}
	public void setQueryYear(String queryYear) {
		this.queryYear = queryYear;
	}
	public void setLecturerId(Integer lecturerId) {
		this.lecturerId = lecturerId;
	}
	public Integer getLecturerId() {
		return lecturerId;
	}

	
}
