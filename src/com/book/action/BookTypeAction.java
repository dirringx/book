package com.book.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.book.pojos.Book;
import com.book.pojos.BookType;
import com.book.service.BookService;
import com.book.service.BookTypeService;
import com.book.core.util.ActionContextUtils;
import com.book.core.web.action.BaseAction;

import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("serial")
public class BookTypeAction extends BaseAction implements ModelDriven<BookType> {

	/** 日志记录类 **/
	public static Log logger = LogFactory.getLog(BookTypeAction.class);

	/** bookTypeService **/
	private BookTypeService bookTypeService;

	/** bookService **/
	private BookService bookService;

	/** bookType **/
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
		List<Book> books = bookService
				.findBookByType(bookTypeService.findBookByType(bookType.getMajor(), bookType.getGrade()).getId());
		ActionContextUtils.setAttributeToSession("books", books);
		return "book";
	}

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}

	public void setBookTypeService(BookTypeService bookTypeService) {
		this.bookTypeService = bookTypeService;
	}
}
