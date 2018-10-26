package com.book.action;

import javax.annotation.Resource;

import com.book.pojos.BookType;
import com.book.service.BookService;
import com.book.service.BookTypeService;
import com.book.core.util.ActionContextUtils;
import com.book.core.web.action.BaseAction;

import com.opensymphony.xwork2.ModelDriven;

public class BookTypeAction extends BaseAction implements ModelDriven<BookType> {
	private static final long serialVersionUID = 1L;

	@Resource(name = "bookTypeService")
	private BookTypeService bookTypeService;

	@Resource(name = "bookService")
	private BookService bookService;

	private BookType bookType;

	public BookType getModel() {
		if (bookType == null)
			bookType = new BookType();
		return bookType;
	}

	/**
	 * 通过专业和年级查找书籍
	 * 
	 * @return
	 */
	public String find() {
		BookType bt = bookTypeService.findBookByType(bookType.getMajor(), bookType.getGrade());
		if (bt != null)
			ActionContextUtils.setAttributeToSession("books", bookService.findBookByType(bt.getId()));
		return "book";
	}
}
