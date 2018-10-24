package com.book.dao;

import com.book.core.web.dao.BaseDao;
import com.book.pojos.OrderItem;

public interface OrderItemDao extends BaseDao<OrderItem> {

	/**
	 * 通过书籍查找订单
	 * 
	 * @param id
	 * @return
	 */
	OrderItem findByBook(String id);
}
