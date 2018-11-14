package com.book.pojos;

public class Course {

	/** 主键 **/
	private String id;
	/** 课程专业 **/
	private String major;
	/** 课程名称 **/
	private String name;
	/** 年级 **/
	private String grade;
	/** 学院 **/
	private String college;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

}
