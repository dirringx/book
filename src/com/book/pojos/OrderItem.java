package com.book.pojos;

import java.io.Serializable;

@SuppressWarnings("serial")
public class OrderItem implements Serializable{

	private Integer id;
	
	/** 订单属性 **/
	private Order order;
	
	/** 商品属性 **/
	private Book book;
	
	/** 商品数量 **/
	private Integer quantity;
	
	/** 购买价格 **/
	private Float purchasePrice;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Float getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(Float purchasePrice) {
		this.purchasePrice = purchasePrice;
	}



}