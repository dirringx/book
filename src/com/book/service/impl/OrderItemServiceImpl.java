package com.book.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.book.core.web.service.impl.BaseServiceImpl;
import com.book.dao.OrderItemDao;
import com.book.pojos.OrderItem;
import com.book.service.OrderItemService;

@Service(value = "orderItemService")
public class OrderItemServiceImpl extends BaseServiceImpl<OrderItem> implements OrderItemService {

	@Resource(name = "orderItemDao")
	private OrderItemDao orderItemDao;

	@Override
	public void delete(OrderItem obj) {
		orderItemDao.delete(obj);
	}
	
	@Override
	public void update(OrderItem obj) {
		orderItemDao.update(obj);
	}
	
	@Override
	public OrderItem findByID(Class<OrderItem> clazz, int id) {
		return orderItemDao.findByID(clazz, id);
	}
	
	public OrderItem findByBook(String id) {
		return orderItemDao.findByBook(id);
	}
}
