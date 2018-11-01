package com.book.action;

import javax.annotation.Resource;

import com.book.core.util.ActionContextUtils;
import com.book.core.util.CommonMsg;
import com.book.core.util.JsonUtils;
import com.book.core.util.StringUtils;
import com.book.core.web.action.BaseAction;
import com.book.pojos.Book;
import com.book.pojos.BookType;
import com.book.pojos.Student;
import com.book.service.BookService;
import com.book.service.BookTypeService;

public class BookAction extends BaseAction {
	private static final long serialVersionUID = 1L;

	@Resource(name = "bookService")
	private BookService bookService;

	@Resource(name = "bookTypeService")
	private BookTypeService bookTypeService;

	/** ISBN **/
	private String isbn;

	/**
	 * 书籍的json信息
	 */
	private String bookJson;

	/**
	 * 书籍类型的json信息
	 */
	private String bookTypeJson;

	/**
	 * 显示书籍信息
	 */
	public void show() {
		this.bookList();
	}

	@Override
	public void validate() {
		System.out.println(bookJson);
		System.out.println(bookTypeJson);
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
		Book book = new Book();
		BookType bt = new BookType();

		// json转javaBean对象
		bt = JsonUtils.jsonToBean(bookTypeJson, BookType.class);
		book = JsonUtils.jsonToBean(bookJson, Book.class);

		// 查询所添加的书籍类别是否已经存在
		BookType bookType = bookTypeService.findBookByType(bt.getMajor(), bt.getGrade());

		// 存在直接添加
		if (bookType != null) {
			book.setBookType(bookType);
		}

		// 不存在时新添加一个书籍类别记录
		else {
			bookType = new BookType();
			bookType.setCollege(bt.getCollege());
			bookType.setGrade(bt.getMajor());
			bookType.setMajor(bt.getGrade());
			book.setBookType(bookType);
		}

		book.setBookImage("img/book.jpg");

		// 添加书籍
		bookService.add(book);

		// 返回信息
		CommonMsg cg = new CommonMsg();
		cg.setStatus("200");
		cg.setMessage("添加成功");
		cg.setData("NULL");
		ActionContextUtils.setAtrributeToRequest("result", JsonUtils.beanToJson(cg));
		
		return "ajaxReturn";

	}

	public String getBookTypeJson() {
		return bookTypeJson;
	}

	public void setBookTypeJson(String bookTypeJson) {
		this.bookTypeJson = bookTypeJson;
	}

	public String getBookJson() {
		return bookJson;
	}

	public void setBookJson(String bookJson) {
		this.bookJson = bookJson;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
}