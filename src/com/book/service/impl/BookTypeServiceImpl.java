package com.book.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.book.core.web.service.impl.BaseServiceImpl;
import com.book.dao.BookTypeDao;
import com.book.pojos.BookType;
import com.book.service.BookTypeService;

@Service(value = "bookTypeService")
public class BookTypeServiceImpl extends BaseServiceImpl<BookType> implements BookTypeService {

	@Resource(name = "bookTypeDao")
	private BookTypeDao bookTypeDao;

	public BookType findBookByType(String major, String grade) {
		return bookTypeDao.findBookByType(major, grade);
	}

}
