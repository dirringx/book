package com.book.service;

import java.util.List;

import com.book.core.web.service.BaseService;
import com.book.pojos.BookItem;

public interface BookItemService extends BaseService<BookItem>{
	List<BookItem> findByCourseID(int id);
}
