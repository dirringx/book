package com.book.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.book.core.util.ActionContextUtils;
import com.book.core.util.ExceptionUtils;
import com.book.core.web.action.BaseAction;
import com.book.pojos.Book;
import com.book.pojos.BookType;
import com.book.service.BookService;
import com.book.service.BookTypeService;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("serial")
public class BookAction extends BaseAction implements ModelDriven<Book> {

	/** 日志记录类 **/
	public static Log logger = LogFactory.getLog(BookAction.class);

	/** bookService **/
	private BookService bookService;

	/** BookTypeService **/
	private BookTypeService bookTypeService;

	/** ISBN **/
	private String isbn;

	/** book **/
	private Book book;

	private String grade;

	private String major;

	private String college;

	private String data;
	
	public Book getModel() {
		if (book == null)
			book = new Book();
		return book;
	}

	public void show() {
		this.bookList();
	}

	public String bookList() {
		ActionContextUtils.removeAttrFromSession("len");
		ActionContextUtils.removeAttrFromSession("bookList");
		List<Book> lists = bookService.findAll(Book.class);
		ActionContextUtils.setAttributeToSession("bookList", lists);
		return "success";
	}

	public String findByISBN() {
		Book book = null;
		try {
			book = bookService.findBookByISBN(this.isbn);
		} catch (Exception ex) {
			String event = ExceptionUtils.formatStackTrace(ex);
			logger.error(event);
		}
		ActionContextUtils.setAtrributeToRequest("book", book);
		return "success";
	}

	public String addBook() {
		// 查询所添加的书籍类别是否已经存在
		BookType bookType = bookTypeService.findBookByType(this.major, this.grade);
		// 存在直接添加
		if (bookType != null) {
			this.book.setBookType(bookType);
		}
		// 不存在时新添加一个书籍类别记录
		else {
			bookType = new BookType();
			bookType.setCollege(this.college);
			bookType.setGrade(this.grade);
			bookType.setMajor(this.major);
			this.book.setBookType(bookType);
		}
		// 添加书籍
		bookService.add(this.book);
		return "success";
	}

	public String testJson(){
		return "testJson";
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}
	
	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public void setBookTypeService(BookTypeService bookTypeService) {
		this.bookTypeService = bookTypeService;
	}

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
}