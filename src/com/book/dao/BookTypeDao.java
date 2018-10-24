package com.book.dao;

import com.book.core.web.dao.BaseDao;
import com.book.pojos.BookType;

public interface BookTypeDao extends BaseDao<BookType> {

	/**
	 * 通过年级和专业信息查找书籍类别
	 * 
	 * @param major
	 * @param grade
	 * @return
	 */
	BookType findBookByType(String major, String grade);
}
