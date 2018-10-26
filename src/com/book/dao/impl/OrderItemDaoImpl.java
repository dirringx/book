package com.book.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.book.core.web.dao.impl.BaseDaoImpl;
import com.book.dao.OrderItemDao;
import com.book.pojos.OrderItem;

@Repository(value="orderItemDao")
public class OrderItemDaoImpl extends BaseDaoImpl<OrderItem> implements OrderItemDao{
	
	public OrderItem findByBook(String id) {
		String hql = "from OrderItem o where o.book.id = ?";
		List<OrderItem> orderItems = (List<OrderItem>) this.getHibernateTemplate().find(hql, id);
		if (orderItems == null || orderItems.isEmpty())
			return null;
		return orderItems.get(0);
	}
	
}
