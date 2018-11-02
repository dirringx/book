package com.book.service;

import java.util.List;

import com.book.core.web.service.BaseService;
import com.book.pojos.Book;

public interface BookService extends BaseService<Book> {

	/**
	 * 通过国际标准书号查询书籍
	 * 
	 * @param ISBN
	 *            国际标准书号
	 * @return
	 */
	Book findBookByISBN(String ISBN);

	/**
	 * 通过书籍类别查询
	 * 
	 * @param typeID
	 * @return
	 */
	List<Book> findBookByType(int typeID);

	/**
	 * 通过书籍ISBN码来删除书籍
	 * 
	 * @param ISBN
	 */
	void deleteBookByISBN(String ISBN);
}
