package com.book.pojos;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@SuppressWarnings("serial")
public class Order implements Serializable {
	/** 主键 **/
	private String id;

	/** 学生 **/
	private Student student;

	/** 订单编号 **/
	private String orderNo;

	/** 订单时间 **/
	private Date orderTime;

	/** 订单单向集合 **/
	private Set<OrderItem> orderitems = new HashSet<OrderItem>(0);

	/** 价格 **/
	private Float price;

	/** 付款状态 **/
	private Boolean pay;

	private Boolean groupOrder;
	
	public Boolean getGroupOrder() {
		return groupOrder;
	}
	
	public void setGroupOrder(Boolean groupOrder) {
		this.groupOrder = groupOrder;
	}
	
	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Boolean getPay() {
		return pay;
	}

	public void setPay(Boolean pay) {
		this.pay = pay;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Set<OrderItem> getOrderitems() {
		return orderitems;
	}

	public void setOrderitems(Set<OrderItem> orderitems) {
		this.orderitems = orderitems;
	}
}
