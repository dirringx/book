package com.book.service;

import com.book.core.web.service.BaseService;
import com.book.pojos.OrderItem;

public interface OrderItemService extends BaseService<OrderItem>{

	/**
	 * 通过书籍查找订单
	 * 
	 * @param id
	 * @return
	 */
	OrderItem findByBook(String id);
	
}
