package com.book.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.book.core.web.dao.impl.BaseDaoImpl;
import com.book.dao.BookTypeDao;
import com.book.pojos.BookType;

@Repository(value="bookTypeDao")
public class BookTypeDaoImpl extends BaseDaoImpl<BookType> implements BookTypeDao {

	public BookType findBookByType(String major, String grade) {
		String hql = "from BookType b where b.grade = ? and b.major = ?";
		List<BookType> bookTypes = (List<BookType>) this.getHibernateTemplate().find(hql, grade, major);
		if (bookTypes.isEmpty() || bookTypes == null)
			return null;
		return bookTypes.get(0);
	}
}
