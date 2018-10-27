package com.book.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import com.book.core.util.ActionContextUtils;
import com.book.core.web.action.BaseAction;
import com.book.pojos.Book;
import com.book.pojos.Order;
import com.book.pojos.OrderItem;
import com.book.pojos.Student;
import com.book.service.BookService;
import com.book.service.OrderItemService;
import com.book.service.OrderService;
import com.book.service.StudentService;

public class OrderAction extends BaseAction {
	private static final long serialVersionUID = 1L;

	@Resource(name = "orderItemService")
	private OrderItemService orderItemService;

	@Resource(name = "studentService")
	private StudentService studentService;

	@Resource(name = "orderService")
	private OrderService orderService;

	@Resource(name = "bookService")
	private BookService bookService;

	private String orderNo;

	private String price;

	private String isbn;

	/**
	 * 购买状态
	 */
	private String np;

	@Override
	public void validate() {
		System.out.println(this.np);
	}

	/**
	 * 显示学生下的订单信息
	 * 
	 * @return
	 */
	public String show() {
		ActionContextUtils.removeAttrFromSession("stu_orders");
		Student student = (Student) ActionContextUtils.getAttribute("student", "session");

		if (student == null)
			return "login";

		try {
			Order order = null;
			List<Order> orders = orderService.findOrderBystudentID(student.getId());
			// 未完成订单集合
			if ("1".equals(this.np)) {
				Iterator<Order> ordersIterator = orders.iterator();
				while (ordersIterator.hasNext()) {
					order = ordersIterator.next();
					if (order.getPay())
						orders.remove(order);
				}
			}

			// 已经完成订单集合
			if ("2".equals(this.np)) {
				Iterator<Order> ordersIterator = orders.iterator();
				while (ordersIterator.hasNext()) {
					order = ordersIterator.next();
					if (!order.getPay())
						orders.remove(order);
				}
			}
			ActionContextUtils.setAttributeToSession("stu_orders", orders);
		} catch (Exception e) {

		}
		return "show";
	}

	/**
	 * 显示订单信息
	 * 
	 * @return
	 */
	public String orderList() {
		Order order = orderService.findByorderNo(this.orderNo);
		if (order != null) {
			ActionContextUtils.setAttributeToSession("order", order);
			List<OrderItem> orderItemList = new ArrayList<OrderItem>(order.getOrderitems());
			if (orderItemList != null || !orderItemList.isEmpty())
				ActionContextUtils.setAttributeToSession("orderBookList", orderItemList);
		}
		return "admin";
	}

	public String delBook() {
		ActionContextUtils.removeAttrFromSession("order");
		ActionContextUtils.removeAttrFromSession("orderBookList");

		Book book = null;
		Order order = null;
		List<OrderItem> orderItemList = null;

		try {
			order = orderService.findByorderNo(this.orderNo);
			orderItemList = new ArrayList<OrderItem>(order.getOrderitems());
			Iterator<OrderItem> orderItemListIterator = orderItemList.iterator();
			while (orderItemListIterator.hasNext()) {
				OrderItem ot = orderItemListIterator.next();
				book = ot.getBook();
				if (book.getISBN().equals(this.isbn))
					orderItemList.remove(ot);
			}
			ActionContextUtils.setAttributeToSession("orderBookList", orderItemList);
			ActionContextUtils.setAttributeToSession("order", order);
			bookService.findBookByISBN(book.getISBN());
			orderItemService.delete(orderItemService.findByBook(book.getId()));
		} catch (Exception e) {

		}
		return "admin";
	}

	/**
	 * 学生下订单
	 * 
	 * @return
	 */
	public String buy() {
		return SUCCESS;
	}

	public String getNp() {
		return np;
	}

	public void setNp(String np) {
		this.np = np;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
}