package com.book.pojos;

import java.io.Serializable;

@SuppressWarnings("serial")
public class BookItem implements Serializable{

	private String id;
	private Book book;
	private Course course;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}
	
}
