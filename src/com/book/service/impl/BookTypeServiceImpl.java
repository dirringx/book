package com.book.service.impl;

import com.book.core.web.service.impl.BaseServiceImpl;
import com.book.dao.BookTypeDao;
import com.book.pojos.BookType;
import com.book.service.BookTypeService;

public class BookTypeServiceImpl extends BaseServiceImpl<BookType> implements BookTypeService{

	private BookTypeDao bookTypeDao;
	
	public void setBookTypeDao(BookTypeDao bookTypeDao) {
		this.bookTypeDao = bookTypeDao;
	}
	
	public BookType findBookByType(String major, String grade) {
		return bookTypeDao.findBookByType(major, grade);
	}

}
