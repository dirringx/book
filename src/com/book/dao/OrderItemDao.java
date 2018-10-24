package com.book.dao;

import com.book.core.web.dao.BaseDao;
import com.book.pojos.OrderItem;

public interface OrderItemDao extends BaseDao<OrderItem>{

	public OrderItem findByBook(String id);
}
