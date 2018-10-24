package com.book.service.impl;

import com.book.core.web.service.impl.BaseServiceImpl;
import com.book.dao.OrderItemDao;
import com.book.pojos.OrderItem;
import com.book.service.OrderItemService;

public class OrderItemServiceImpl extends BaseServiceImpl<OrderItem> implements OrderItemService {

	private OrderItemDao orderItemDao;
	
	public void setOrderItemDao(OrderItemDao orderItemDao) {
		this.orderItemDao = orderItemDao;
	}
	
	public OrderItem findByBook(String id) {
		return orderItemDao.findByBook(id);
	}

	
}
