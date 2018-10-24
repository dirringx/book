package com.book.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.book.core.util.ActionContextUtils;
import com.book.core.util.StringUtils;
import com.book.core.web.action.BaseAction;
import com.book.pojos.Book;
import com.book.pojos.Order;
import com.book.pojos.OrderItem;
import com.book.pojos.Student;
import com.book.service.BookService;
import com.book.service.OrderItemService;
import com.book.service.OrderService;
import com.book.service.StudentService;

@SuppressWarnings({ "serial", "unchecked", "unused" })
public class OrderAction extends BaseAction {

	/** 日志记录类 **/
	public static Log logger = LogFactory.getLog(OrderAction.class);

	private OrderItemService orderItemService;

	private StudentService studentService;

	private OrderService orderService;

	private BookService bookService;

	private String orderNo;

	private String price;

	private String isbn;

	private String np;

	@Override
	public void validate() {
		System.out.println(this.np);
	}

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
			if (e.getClass() == java.util.ConcurrentModificationException.class) {
				System.out.println("nice");
			}
		}
		return "show";
	}

	public String orderList() {
		try {
			Order order = orderService.findByorderNo(this.orderNo);
			if (order != null) {
				ActionContextUtils.setAttributeToSession("order", order);
				List<OrderItem> orderItemList = new ArrayList<OrderItem>(order.getOrderitems());
				if (orderItemList != null || !orderItemList.isEmpty()) {
					ActionContextUtils.setAttributeToSession("orderBookList", orderItemList);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
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
				if (book.getISBN().equals(this.isbn)) {
					orderItemList.remove(ot);
				}
			}
			ActionContextUtils.setAttributeToSession("orderBookList", orderItemList);
			ActionContextUtils.setAttributeToSession("order", order);
			bookService.findBookByISBN(book.getISBN());
			orderItemService.delete(orderItemService.findByBook(book.getId()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin";
	}

	public String buy() {
		try {
			List<Book> books = (List<Book>) ActionContextUtils.getAttribute("bookList", "session");
			Student student = (Student) ActionContextUtils.getAttribute("student", "session");
			Order order = new Order();
			order.setStudent((student));
			order.setOrderNo(StringUtils.createOrderNumber(1, 1));
			order.setOrderTime(new Date());
			order.setPay(false);

			// OrderItem orderItem1 = new OrderItem();
			// orderItem1.setOrder(order);
			// orderItem1.setBook(bookDao.findBookByISBN("1"));
			// orderItem1.setQuantity();
			// orderItem1.setPurchasePrice();
			//
			// OrderItem orderItem2 = new OrderItem();
			// orderItem2.setOrder(order);
			// orderItem2.setBook(bookDao.findBookByISBN(""));
			// orderItem2.setQuantity();
			// orderItem2.setPurchasePrice();
			//
			// order.getOrderitems().add(orderItem1);
			// order.getOrderitems().add(orderItem2);
			// Float p = orderItem1.getPurchasePrice() +
			// orderItem2.getPurchasePrice();
			// order.setPrice(p);
			// orderService.add(order);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
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

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public void setOrderItemService(OrderItemService orderItemService) {
		this.orderItemService = orderItemService;
	}

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
}