package com.book.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import com.book.core.util.ActionContextUtils;
import com.book.core.util.CommonMsg;
import com.book.core.util.JsonUtils;
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

	private String bookJson;

	private String orderNo;

	private String price;

	private String isbn;

	/**
	 * 购买状态
	 */
	private String np;

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
	 * 管理员删除订单中的书籍
	 * 
	 * @return
	 */
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

	/**
	 * 学生下订单
	 * 
	 * @return
	 */
	public String buy() {
		// session中获取用户
		Student student = (Student) ActionContextUtils.getAttribute("student", "session");

		// 未登录返回登陆
		if (student == null)
			return "login";

		// 获取前台的书籍列表
		List<Book> books = JsonUtils.jsonToBeanList(bookJson, Book.class);

		// 创建订单
		Order order = new Order();
		// 设置下订单用户信息
		order.setStudent(student);
		// 创建订单编号
		order.setOrderNo(StringUtils.createOrderNumber(1, 1));
		// 订单产生时间
		order.setOrderTime(new Date());
		// 订单付款状态，默认未付款false
		order.setPay(false);
		// 订单总金额
		Float totalAmount = 0f;

		if (books.isEmpty() || books != null) {
			for (Book b : books) {
				if (b.getNumber() > 0) {
					// 创建订单项
					OrderItem orderItem = new OrderItem();
					Book book = bookService.findBookByISBN(b.getISBN());
					if (book != null) {
						// 设置订单
						orderItem.setOrder(order);
						// 设置订单项中书籍
						orderItem.setBook(book);
						// 设置数量
						orderItem.setQuantity(b.getNumber());
						// 设置购买时价格
						orderItem.setPurchasePrice(book.getDiscount());
						// 计算总金额
						totalAmount = totalAmount + book.getDiscount() * b.getNumber();
					}
					// 订单添加订单项
					order.getOrderitems().add(orderItem);
				}
			}
		}

		// 订单总金额
		order.setPrice(totalAmount);
		System.out.println(totalAmount);
		if (totalAmount > 0) {
			// 添加订单
			orderService.add(order);
			// 返回信息
			CommonMsg cg = new CommonMsg();
			cg.setStatus("200");
			cg.setMessage("购买成功！");
			cg.setData("NULL");
			ActionContextUtils.setAtrributeToRequest("result", cg);
		} else {
			// 返回信息
			CommonMsg cg = new CommonMsg();
			cg.setStatus("-1");
			cg.setMessage("购买失败！请填写正确的数量！");
			cg.setData("NULL");
			ActionContextUtils.setAtrributeToRequest("result", JsonUtils.beanToJson(cg));
		}
		return "ajaxReturn";
	}

	public String getBookJson() {
		return bookJson;
	}

	public void setBookJson(String bookJson) {
		this.bookJson = bookJson;
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