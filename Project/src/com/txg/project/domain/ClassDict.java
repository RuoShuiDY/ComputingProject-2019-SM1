package com.txg.project.domain;

public class ClassDict {

	private String classId;
	private String className;
	
	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	@Override
	public String toString() {
		return "ClassDict [classId=" + classId + ", className=" + className + "]";
	}
	
}
