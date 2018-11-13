package com.book.service;

import java.util.List;

import com.book.core.web.service.BaseService;
import com.book.pojos.Order;

public interface OrderService extends BaseService<Order>{

	/**
	 * 通过学生学号查询该学生下的订单，按照时间降序排列
	 * 
	 * @param studentID
	 *            学号
	 * @return
	 */
	public List<Order> findOrderBystudentID(int id) ;

	/**
	 * 通过书籍查询订单
	 * 
	 * @param ISBN
	 *            书籍的ISBN号
	 * @return
	 */
	public Order findOrderByBookISBN(String ISBN) ;
	
	/**
	 * 通过订单编号查找
	 * 
	 * @param orderNo
	 *            订单编号
	 * @return
	 */	
	public Order findByorderNo(String orderNo);
	
}
