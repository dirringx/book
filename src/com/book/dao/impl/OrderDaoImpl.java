package com.book.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.book.core.web.dao.impl.BaseDaoImpl;
import com.book.dao.OrderDao;
import com.book.pojos.Order;

@Repository(value="orderDao")
public class OrderDaoImpl extends BaseDaoImpl<Order> implements OrderDao {

	public List<Order> findOrderBystudentID(int id) {
		String hql = "from Order o where o.student.id = ? order by o.orderTime desc";
		return (List<Order>) this.getHibernateTemplate().find(hql, id);
	}

	public Order findOrderByBookISBN(String ISBN) {
		String hql = "from Order o where o.ISBN = ?";
		List<Order> orders = (List<Order>) this.getHibernateTemplate().find(hql, ISBN);
		if (orders == null || orders.isEmpty())
			return null;
		return orders.get(0);

	}

	public Order findByorderNo(String orderNo) {
		String hql = "from Order o where o.orderNo = ?";
		List<Order> orders = (List<Order>) this.getHibernateTemplate().find(hql, orderNo);
		if (orders == null || orders.isEmpty())
			return null;
		return orders.get(0);
	}

}
