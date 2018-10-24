package com.book.service.impl;

import java.util.List;

import com.book.core.web.service.impl.BaseServiceImpl;
import com.book.dao.BookDao;
import com.book.pojos.Book;
import com.book.service.BookService;

public class BookServiceImpl extends BaseServiceImpl<Book> implements BookService{

	private BookDao bookDao;
	
	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}

	@Override
	public void add(Book obj) {
		bookDao.add(obj);
	}
	
	public List<Book> findAll(Class<Book> clazz) {
		return bookDao.findAll(clazz);
	}
	
	public Book findBookByISBN(String ISBN) {
		return bookDao.findBookByISBN(ISBN);
	}

	public List<Book> findBookByType(int typeID) {
		return bookDao.findBookByType(typeID);
	}
}
