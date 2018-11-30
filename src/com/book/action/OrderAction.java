package com.book.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.springframework.orm.hibernate5.HibernateOptimisticLockingFailureException;

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

	private String orderItemJson;

	private String orderNo;

	private String classOrder;

	private String price;

	private String isbn;

	/**
	 * 购买状态
	 */
	private String np;

	public String buySuccess() {
		return "buySuccess";
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

		Order order = null;

		try {
			List<Order> orders = orderService.findOrderBystudentID(student.getId());
			Iterator<Order> ordersIterator = orders.iterator();
			while (ordersIterator.hasNext()) {
				order = ordersIterator.next();
				if (order.getGroupOrder())
					ordersIterator.remove();
			}

			// 未完成订单集合
			if ("1".equals(this.np)) {
				ordersIterator = orders.iterator();
				while (ordersIterator.hasNext()) {
					order = ordersIterator.next();
					if (order.getPay())
						ordersIterator.remove();
				}
			}

			// 已经完成订单集合
			if ("2".equals(this.np)) {
				ordersIterator = orders.iterator();
				while (ordersIterator.hasNext()) {
					order = ordersIterator.next();
					if (!order.getPay())
						ordersIterator.remove();
				}
			}
			ActionContextUtils.setAttributeToSession("stu_orders", orders);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "show";
	}

	/**
	 * 管理员删除订单中的书籍
	 * 
	 * @return
	 */
	public String delBookFromOrder() {
		ActionContextUtils.removeAttrFromSession("orderBookList");
		ActionContextUtils.removeAttrFromSession("order");

		// 获取根据订单号获取信息
		Order order = orderService.findByorderNo(orderNo);

		if (order == null) {
			ActionContextUtils.setAtrributeToRequest("msg", "未查询到此订单记录！");
			return "admin";
		}

		// 获取订单项
		List<OrderItem> orderItemList = new ArrayList<OrderItem>(order.getOrderitems());

		// 删除订单项中书籍
		for (OrderItem ot : orderItemList) {
			Book b = ot.getBook();
			if (b.getISBN().equals(this.isbn)) {
				orderItemService.delete(ot);
			}
		}

		// 重新获取订单记录
		order = orderService.findByorderNo(orderNo);
		ActionContextUtils.setAttributeToSession("order", order);
		ActionContextUtils.setAttributeToSession("orderBookList", new ArrayList<OrderItem>(order.getOrderitems()));
		return "admin";
	}

	/**
	 * 管理员显示订单信息
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
	 * 管理员更新订单记录
	 * 
	 * @return
	 */
	public String updateOrder() {
		List<OrderItem> orderItems = JsonUtils.jsonToBeanList(orderItemJson, OrderItem.class);
		// 返回消息
		CommonMsg cg = new CommonMsg();
		if (orderItems == null) {
			cg.setMessage("系统故障，请联系管理员！");
			cg.setStatus("0");
			cg.setData("NULL");
			ActionContextUtils.setAtrributeToRequest("result", JsonUtils.beanToJson(cg));
			return "ajaxReturn";
		}

		for (OrderItem ot : orderItems) {
			if (ot.getQuantity() <= 0) {
				cg.setMessage("修改失败！请输出正确的数量");
				cg.setStatus("-1");
				cg.setData("NULL");
				ActionContextUtils.setAtrributeToRequest("result", JsonUtils.beanToJson(cg));
				return "ajaxReturn";
			}
		}

		Float totalAmount = 0f;
		
		for (OrderItem ot : orderItems) {
			OrderItem orderItem = orderItemService.findByID(OrderItem.class, ot.getId());
			orderItem.setQuantity(ot.getQuantity());
			Float f = ot.getQuantity() * orderItem.getBook().getDiscount();
			orderItem.setPurchasePrice(f);
			totalAmount += f;
			orderItemService.update(orderItem);
		}
		Order order = orderService.findByorderNo(orderNo);
		order.setPrice(totalAmount);
		orderService.update(order);

		cg.setMessage("订单修改成功！");
		cg.setStatus("200");
		cg.setData("NULL");
		ActionContextUtils.setAtrributeToRequest("result", JsonUtils.beanToJson(cg));

		return "ajaxReturn";
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
		order.setGroupOrder(false);
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
				if (b.getNumber() < 0) {
					totalAmount = -1f;
					break;
				}
			}
		}

		// 订单总金额
		order.setPrice(totalAmount);
		if (totalAmount > 0) {
			// 添加订单
			orderService.add(order);
			// 返回信息
			CommonMsg cg = new CommonMsg();
			cg.setStatus("200");
			cg.setMessage("购买成功！");
			cg.setData("NULL");
			ActionContextUtils.setAtrributeToRequest("result", JsonUtils.beanToJson(cg));
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

	public String pay() {
		Order order = orderService.findByorderNo(this.orderNo);
		if (order != null) {
			order.setPay(true);
			orderService.update(order);
		}
		if ("1".equals(this.classOrder)) {
			return classOrder();
		} else {
			return show();
		}
	}

	public String classOrder() {
		Student student = (Student) ActionContextUtils.getAttribute("student", "session");
		if (student == null)
			return "login";
		Order order = null;
		try {
			List<Order> orders = new ArrayList<Order>();
			Order o = orderService.findClassOrderByStudentID(student.getId());
			if (o.getOrderitems().size() > 0) {
				orders.add(o);
			} else {
				orders = null;
			}
			// 未完成订单集合
			if ("1".equals(this.np)) {
				Iterator<Order> ordersIterator = orders.iterator();
				while (ordersIterator.hasNext()) {
					order = ordersIterator.next();
					if (order.getPay())
						ordersIterator.remove();
				}
			}
			// 已经完成订单集合
			if ("2".equals(this.np)) {
				Iterator<Order> ordersIterator = orders.iterator();
				while (ordersIterator.hasNext()) {
					order = ordersIterator.next();
					if (!order.getPay())
						ordersIterator.remove();
				}
			}
			ActionContextUtils.setAttributeToSession("class_orders", orders);
		} catch (Exception e) {
		}
		return "classOrder";
	}

	public String viewOrder() {
		try{
			Student student = (Student) ActionContextUtils.getAttribute("m_student", "session");
			if (student == null)
				return "adminlogin";
			Order classOrder = orderService.findClassOrderByStudentID(student.getId());
			ActionContextUtils.setAttributeToSession("v_classOrder", classOrder);
//			Map<String, Book> bookMap = new HashMap<String, Book>();
			if (classOrder != null) {
				List<OrderItem> ots = new ArrayList<OrderItem>(classOrder.getOrderitems());
//				for(OrderItem orderItem : ots)
//					bookMap.put(orderItem.getBook().getISBN(), orderItem.getBook());
				ActionContextUtils.setAttributeToSession("c_orderItems", ots);
			}
			List<Student> students = studentService.findStudentByclass(student.getStudentClass());
			List<Order> orders = new ArrayList<Order>();
			for (Student stu : students) {
				List<Order> os = orderService.findOrderBystudentID(stu.getId());
				Iterator<Order> ordersIterator = os.iterator();
				Order order = null;
				while (ordersIterator.hasNext()) {
					order = ordersIterator.next();
					if (order.getGroupOrder()){
						ordersIterator.remove();
					}
//					List<OrderItem> ots = new ArrayList<OrderItem>(order.getOrderitems());
//					Iterator<OrderItem> otsIterator = ots.iterator();
//					while(otsIterator.hasNext()){
//						OrderItem orderItem = otsIterator.next();
//						for (Map.Entry<String, Book> entry : bookMap.entrySet()) {
//							if(orderItem.getBook().getISBN().equals(entry.getValue().getISBN()))
//								continue;
//							OrderItem oi = new OrderItem();
//							oi.setBook(entry.getValue());
//							oi.setQuantity(0);
//							ots.add(oi);
//							order.getOrderitems().add(oi);
//						}
//					}
					order.setStudent(stu);
				}
				orders.addAll(os);
			}
			ActionContextUtils.setAttributeToSession("v_orders", orders);
		}catch (Exception e) {
		}
		return "viewOrder";
	}

	/**
	 * 统计班级订单
	 * 
	 * @return
	 */
	public String count() {
		Student student = studentService.findStudentBystudentID("201610098000");
		Order classOrder = orderService.findClassOrderByStudentID(student.getId());
		String coNo = null;
		Boolean flag = false;
		if (classOrder != null) {
			List<OrderItem> ots = new ArrayList<OrderItem>(classOrder.getOrderitems());
			for (OrderItem ot : ots)
				orderItemService.delete(ot);
			flag = true;
			coNo = classOrder.getOrderNo();
		} else {
			classOrder = new Order();
		}
		// 设置下订单用户信息
		classOrder.setStudent(student);
		// 创建订单编号
		classOrder.setOrderNo(StringUtils.createOrderNumber(1, 1));
		// 订单产生时间
		classOrder.setOrderTime(new Date());
		// 订单付款状态，默认未付款false
		classOrder.setPay(false);
		// 班级订单
		classOrder.setGroupOrder(true);
		// 订单总金额
		Float totalAmount = 0f;
		List<Student> students = studentService.findStudentByclass(student.getStudentClass());
		Map<String, Book> bookMap = new HashMap<String, Book>();
		for (Student stu : students) {
			List<Order> os = orderService.findOrderBystudentID(stu.getId());
			for (Order o : os) {
				if (o.getGroupOrder() || !o.getPay())
					continue;
				for (OrderItem ot : o.getOrderitems()) {
					String ISBN = ot.getBook().getISBN();
					Integer quantity = ot.getQuantity();
					Book b = bookMap.get(ISBN);
					if (b == null) {
						ot.getBook().setNumber(quantity);
						bookMap.put(ISBN, ot.getBook());
					} else {
						b.setNumber(quantity + b.getNumber());
						bookMap.put(ISBN, b);
					}
				}
			}
		}
		
		if(bookMap.size() == 0)
			return this.classOrder();
		
		for (Map.Entry<String, Book> entry : bookMap.entrySet()) {
			Book b = entry.getValue();
			// 创建订单项
			OrderItem orderItem = new OrderItem();
			// 设置订单
			orderItem.setOrder(classOrder);
			// 设置订单项中书籍
			orderItem.setBook(b);
			// 设置数量
			orderItem.setQuantity(b.getNumber());
			// 设置购买时价格
			orderItem.setPurchasePrice(b.getDiscount());
			// 计算总金额
			totalAmount += b.getDiscount() * b.getNumber();
			if (flag == false)
				classOrder.getOrderitems().add(orderItem);
			else {
				orderItemService.add(orderItem);
			}
		}
		
		try {
			if (flag == false && totalAmount > 0) {
				// 订单总金额
				classOrder.setPrice(totalAmount);
				orderService.add(classOrder);
			} else {
				Order co = orderService.findByorderNo(coNo);
				// 订单总金额
				co.setPrice(totalAmount);
				orderService.update(co);
			}
		} catch (HibernateOptimisticLockingFailureException e) {
		} catch (HibernateException he) {
		}
		return this.classOrder();
	}

	public String getOrderItemJson() {
		return orderItemJson;
	}

	public void setOrderItemJson(String orderItemJson) {
		this.orderItemJson = orderItemJson;
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

	public String getClassOrder() {
		return classOrder;
	}

	public void setClassOrder(String classOrder) {
		this.classOrder = classOrder;
	}
}