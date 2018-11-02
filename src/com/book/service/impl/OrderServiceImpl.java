package com.book.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.book.core.web.service.impl.BaseServiceImpl;
import com.book.dao.OrderDao;
import com.book.pojos.Order;
import com.book.service.OrderService;

@Service(value = "orderService")
public class OrderServiceImpl extends BaseServiceImpl<Order> implements OrderService {

	@Resource(name = "orderDao")
	private OrderDao orderDao;

	@Override
	public void add(Order obj) {
		orderDao.add(obj);
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
