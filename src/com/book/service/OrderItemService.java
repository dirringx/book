package com.book.service;

import com.book.core.web.service.BaseService;
import com.book.pojos.OrderItem;

public interface OrderItemService extends BaseService<OrderItem>{

	public OrderItem findByBook(String id);
	
}
