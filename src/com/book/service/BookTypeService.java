package com.book.service;

import com.book.core.web.service.BaseService;
import com.book.pojos.BookType;

public interface BookTypeService extends BaseService<BookType>{

	public BookType findBookByType(String major,String grade);
}
