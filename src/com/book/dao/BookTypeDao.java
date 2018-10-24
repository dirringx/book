package com.book.dao;

import com.book.core.web.dao.BaseDao;
import com.book.pojos.BookType;

public interface BookTypeDao extends BaseDao<BookType>{

	
	public BookType findBookByType(String major,String grade);
}
