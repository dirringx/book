package com.book.dao;

import java.util.List;

import com.book.core.web.dao.BaseDao;
import com.book.pojos.Book;

public interface BookDao extends BaseDao<Book> {

	/**
	 * 通过国际标准书号查询书籍
	 * 
	 * @param ISBN
	 *            国际标准书号
	 * @return
	 */
	public Book findBookByISBN(String ISBN);

	/**
	 * 通过书籍类别查询
	 * 
	 * @param typeID
	 * @return
	 */
	public List<Book> findBookByType(int typeID);

	void add(Book obj);
}
