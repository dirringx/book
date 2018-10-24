package com.book.service;

import java.util.List;

import com.book.core.web.service.BaseService;
import com.book.pojos.Book;

public interface BookService extends BaseService<Book>{

	/**
	 * 通过国际标准书号查询书籍
	 * 
	 * @param ISBN
	 *            国际标准书号
	 * @return
	 */
	public Book findBookByISBN(String ISBN);
	
	public List<Book> findBookByType(int typeID);
}
