package com.book.dao.impl;

import java.util.List;

import com.book.core.web.dao.impl.BaseDaoImpl;
import com.book.dao.BookDao;
import com.book.pojos.Book;

@SuppressWarnings("unchecked")
public class BookDaoImpl extends BaseDaoImpl<Book> implements BookDao {

	public Book findBookByISBN(String ISBN) {
		String hql = "from Book b where b.ISBN = ?";
		List<Book> books = (List<Book>) this.getHibernateTemplate().find(hql, ISBN);
		if (books == null || books.isEmpty())
			return null;
		return books.get(0);
	}

	public List<Book> findBookByType(int typeID) {
		String hql = "from Book b where b.bookType.id = ?";
		return (List<Book>) this.getHibernateTemplate().find(hql, typeID);
	}

}
