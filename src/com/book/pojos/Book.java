package com.book.pojos;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@SuppressWarnings("serial")
public class Book implements Serializable {

	/* 主键 */
	private String id;

	/* 教材名 */
	private String name;

	/* 作者 */
	private String author;

	/* 所属课程 */
	private String className;

	/* 原价格 */
	private Float price;

	/* 折扣价格 */
	private Float discount;

	/* 教材简介 */
	private String description;

	/* 教材图片 */
	private String bookImage;

	/* ISBN */
	private String ISBN;

	/* 出版社 */
	private String press;

	private BookType bookType;

	/**
	 * 用于记录订单中书籍数量
	 */
	private int number;

	/* 订单单向集合 */
	private Set<OrderItem> orderitems = new HashSet<OrderItem>(0);

	public BookType getBookType() {
		return bookType;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public void setBookType(BookType bookType) {
		this.bookType = bookType;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Float getDiscount() {
		return discount;
	}

	public void setDiscount(Float discount) {
		this.discount = discount;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	public String getPress() {
		return press;
	}

	public void setPress(String press) {
		this.press = press;
	}

	public String getBookImage() {
		return bookImage;
	}

	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<OrderItem> getOrderitems() {
		return orderitems;
	}

	public void setOrderitems(Set<OrderItem> orderitems) {
		this.orderitems = orderitems;
	}
}
