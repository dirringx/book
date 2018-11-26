package com.book.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.book.core.web.dao.impl.BaseDaoImpl;
import com.book.dao.BookItemDao;
import com.book.pojos.BookItem;

@Repository(value = "bookItemDao")
@SuppressWarnings("unchecked")
public class BookItemDaoImpl extends BaseDaoImpl<BookItem> implements BookItemDao {

	@Override
	public List<BookItem> findByCourseID(int id) {
		String hql = "from BookItem b where b.course.id = ?";
		return (List<BookItem>) this.getHibernateTemplate().find(hql, id);
	}

}
