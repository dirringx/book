package com.book.action;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.book.core.util.ActionContextUtils;
import com.book.core.util.StringUtils;
import com.book.core.web.action.BaseAction;
import com.book.pojos.Book;
import com.book.pojos.BookType;
import com.book.pojos.Student;
import com.book.service.BookService;
import com.book.service.BookTypeService;
import com.opensymphony.xwork2.ModelDriven;

@Controller(value = "bookAction")
@Scope(value = "prototype")
public class BookAction extends BaseAction implements ModelDriven<Book> {
	private static final long serialVersionUID = 1L;

	/** 日志记录类 **/
	public static Log logger = LogFactory.getLog(BookAction.class);

	@Resource(name = "bookService")
	private BookService bookService;

	@Resource(name = "bookTypeService")
	private BookTypeService bookTypeService;

	/** ISBN **/
	private String isbn;

	/** book **/
	private Book book;

	private String grade;

	private String major;

	private String college;

	public Book getModel() {
		if (book == null)
			book = new Book();
		return book;
	}

	/**
	 * 显示书籍信息
	 */
	public void show() {
		this.bookList();
	}

	/**
	 * 显示学生能购买书籍
	 * 
	 * @return
	 */
	public String bookList() {
		Student student = (Student) ActionContextUtils.getAttribute("student", "session");

		// 没有学生用户的session缓存信息返回登陆界面
		if (student == null)
			return "login";

		// 获取学生专业年级信息
		String major = student.getMajor();
		String grade = student.getGrade();

		// 检查学生的年级以及专业信息
		if (major.isEmpty() || grade.isEmpty()) {
			return "login";
		}

		// 获取学生能够购买的书籍清单
		BookType bt = bookTypeService.findBookByType(major, grade);
		if (bt != null) {
			ActionContextUtils.setAttributeToSession("bookList", bookService.findBookByType(bt.getId()));
		}

		return SUCCESS;
	}

	/**
	 * 通过ISBN查找书籍
	 * 
	 * @return
	 */
	public String findByISBN() {
		if (!StringUtils.isEmpty(this.isbn))
			ActionContextUtils.setAtrributeToRequest("book", bookService.findBookByISBN(this.isbn));
		return SUCCESS;
	}

	/**
	 * 添加书籍
	 * 
	 * @return
	 */
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
		return SUCCESS;
	}

	public String testJson() {
		return "testJson";
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
}