package com.book.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.book.core.web.service.impl.BaseServiceImpl;
import com.book.dao.OrderDao;
import com.book.pojos.Order;
import com.book.service.OrderService;

@Transactional
public class OrderServiceImpl extends BaseServiceImpl<Order> implements OrderService {

	private OrderDao orderDao;

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	public List<Order> findOrderBystudentID(int id) {
		return orderDao.findOrderBystudentID(id);
	}

	public Order findOrderByBookISBN(String ISBN) {
		return orderDao.findOrderByBookISBN(ISBN);
	}

	public Order findByorderNo(String orderNo) {
		return orderDao.findByorderNo(orderNo);
	}
	
}
