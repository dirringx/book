package com.book.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.book.core.web.service.impl.BaseServiceImpl;
import com.book.dao.BookItemDao;
import com.book.pojos.BookItem;
import com.book.service.BookItemService;

@Service(value = "bookItemService")
public class BookItemServiceImpl extends BaseServiceImpl<BookItem> implements BookItemService {

	@Resource(name = "bookItemDao")
	private BookItemDao bookItemDao;
	
	@Override
	public List<BookItem> findByCourseID(int id) {
		return bookItemDao.findByCourseID(id);
	}
}
