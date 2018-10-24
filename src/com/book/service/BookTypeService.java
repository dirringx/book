package com.book.service;

import com.book.core.web.service.BaseService;
import com.book.pojos.BookType;

public interface BookTypeService extends BaseService<BookType>{

	/**
	 * 通过年级和专业信息查找书籍类别
	 * 
	 * @param major
	 * @param grade
	 * @return
	 */
	BookType findBookByType(String major, String grade);
}
