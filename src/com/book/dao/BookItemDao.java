package com.book.dao;

import java.util.List;

import com.book.core.web.dao.BaseDao;
import com.book.pojos.BookItem;

public interface BookItemDao extends BaseDao<BookItem> {
	List<BookItem> findByCourseID(int id);
}
