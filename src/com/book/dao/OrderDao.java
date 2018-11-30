package com.book.dao;

import java.util.List;

import com.book.core.web.dao.BaseDao;
import com.book.pojos.Order;

public interface OrderDao extends BaseDao<Order> {

	/**
	 * 通过学生学号查询该学生下的订单
	 * 
	 * @param studentID
	 *            学号
	 * @return
	 */
	List<Order> findOrderBystudentID(int id);

	/**
	 * 通过书籍查询订单
	 * 
	 * @param ISBN
	 *            书籍的ISBN号
	 * @return
	 */
	Order findOrderByBookISBN(String ISBN);

	/**
	 * 通过订单编号查找
	 * 
	 * @param orderNo
	 *            订单编号
	 * @return
	 */
	Order findByorderNo(String orderNo);

	List<Order> findClassOrderByStudentID(int id);
}
