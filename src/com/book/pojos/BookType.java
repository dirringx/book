package com.book.pojos;

import java.io.Serializable;

@SuppressWarnings("serial")
public class BookType implements Serializable{

	private int id;
	
	private String grade;
	
	private String college;
	
	private String major;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

}
