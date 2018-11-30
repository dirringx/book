package com.book.pojos;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@SuppressWarnings("serial")
public class Course implements Serializable {

	private int id;

	/** 课程专业 **/
	private String major;
	/** 课程名称 **/
	private String name;
	/** 年级 **/
	private String grade;
	/** 学期 **/
	private Integer term;
	/** 学院 **/
	private String college;
	/** 创建时间 **/
	private Date createTime;
	/** 修改时间 **/
	private Date updateDate;

	private Set<BookItem> bookItems = new HashSet<BookItem>(0);

	public Course() {
	}

	public Course(String name, String major, String college, String grade, Date createTime, Date updateDate) {
		this.name = name;
		this.major = major;
		this.college = college;
		this.grade = grade;
		this.createTime = createTime;
		this.updateDate = updateDate;
	}

	public Course(String name, String major, String college, String grade, Integer term, Date createTime,
			Date updateDate) {
		this.name = name;
		this.major = major;
		this.college = college;
		this.grade = grade;
		this.term = term;
		this.createTime = createTime;
		this.updateDate = updateDate;
	}

	public int getTerm() {
		return term;
	}

	public void setTerm(int term) {
		this.term = term;
	}

	public Set<BookItem> getBookItems() {
		return bookItems;
	}

	public void setBookItems(Set<BookItem> bookItems) {
		this.bookItems = bookItems;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date date) {
		this.createTime = date;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
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
