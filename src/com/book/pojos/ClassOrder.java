package com.book.pojos;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class ClassOrder implements Serializable {
	
	private String id;
	
	/** 订单号 **/
	private String orderNo;
	
	/** 学年 **/
	private String grade;
	
	/** 班级 **/
	private String clasz;
	
	/** 书籍 **/
	private String bookISBN;
	
	/** 金额 **/
	private Float price;
	
	/** 是否付款 **/
	private Boolean pay;
	
	/** 是否领取 **/
	private Boolean get;
	
	/** 产生日期 **/
	private Date orderTime;
	
	/* 数量 */
	private int sales;

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

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getBookISBN() {
		return bookISBN;
	}

	public void setBookISBN(String bookISBN) {
		this.bookISBN = bookISBN;
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

	public Boolean getGet() {
		return get;
	}

	public void setGet(Boolean get) {
		this.get = get;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public String getClasz() {
		return clasz;
	}

	public void setClasz(String clasz) {
		this.clasz = clasz;
	}
}
