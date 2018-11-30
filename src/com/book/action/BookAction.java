package com.book.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.book.core.util.ActionContextUtils;
import com.book.core.util.CommonMsg;
import com.book.core.util.JsonUtils;
import com.book.core.util.StringUtils;
import com.book.core.web.action.BaseAction;
import com.book.pojos.Book;
import com.book.pojos.BookItem;
import com.book.pojos.Course;
import com.book.pojos.Student;
import com.book.service.BookItemService;
import com.book.service.BookService;
import com.book.service.CourseService;

public class BookAction extends BaseAction {
	private static final long serialVersionUID = 1L;

	@Resource(name = "bookService")
	private BookService bookService;

	/**
	 * 书籍的json信息
	 */
	private String bookJson;

	@Resource(name = "courseService")
	private CourseService courseService;

	@Resource(name = "bookItemService")
	private BookItemService bookItemService;

	/**
	 * 书籍类型的json信息
	 */
	private String bookTypeJson;

	private String className;

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

		List<Book> books = new ArrayList<Book>();

		// 获取学生能够购买的书籍清单
		List<Course> courses = courseService.findCourseByGradeAndMajor(grade, major);
		for (Course c : courses) {
			for (BookItem bi : c.getBookItems())
				books.add(bi.getBook());
		}

		ActionContextUtils.setAttributeToSession("bookList", books);
		return SUCCESS;
	}

	/**
	 * 添加书籍
	 * 
	 * @return
	 */
	public String addBook() {
		Course course = JsonUtils.jsonToBean(bookTypeJson, Course.class);
		Book book = JsonUtils.jsonToBean(bookJson, Book.class);

		// 返回信息
		CommonMsg cg = new CommonMsg();

		// 书籍ISBN格式检查
		if (StringUtils.isEmpty(book.getISBN()) || book.getISBN().length() != 17) {
			cg.setStatus("-1");
			cg.setMessage("添加失败！请填写正确的ISBN码！");
			ActionContextUtils.setAtrributeToRequest("result", JsonUtils.beanToJson(cg));
			return "ajaxReturn";
		}
		// 书籍数据完善性检查
		if (StringUtils.isEmpty(book.getName()) || book.getPrice() == null || book.getDiscount() == null) {
			cg.setStatus("-1");
			cg.setMessage("添加失败！书籍信息填写不全！");
			ActionContextUtils.setAtrributeToRequest("result", JsonUtils.beanToJson(cg));
			return "ajaxReturn";
		}

		Course c = courseService.findCourseByNameGradeAndMajor(this.className, course.getGrade(), course.getMajor());
		if (c == null) {
			c = course;
			c.setName(className);
			c.setCreateTime(new Date());
			c.setUpdateDate(new Date());
			courseService.add(c);
		}

		// 判断重复
		Book b = bookService.findBookByISBN(book.getISBN());
		if (b != null) {
			BookItem bookItem = new BookItem();
			bookItem.setBook(b);
			bookItem.setCourse(c);
			b.getBookItems().add(bookItem);
			bookService.update(b);
			cg.setStatus("200");
			cg.setMessage("已经存在该书本信息！数据更新完毕！");
			ActionContextUtils.setAtrributeToRequest("result", JsonUtils.beanToJson(cg));
			return "ajaxReturn";
		} else {
			b = book;
			b.setBookImage("img/book.jpg");
			BookItem bookItem = new BookItem();
			bookItem.setBook(b);
			bookItem.setCourse(c);
			b.getBookItems().add(bookItem);
			bookService.add(book);
			cg.setStatus("200");
			cg.setMessage("添加成功！");
			cg.setData("NULL");
			ActionContextUtils.setAtrributeToRequest("result", JsonUtils.beanToJson(cg));
			return "ajaxReturn";
		}
	}

	/**
	 * 删除书籍
	 * 
	 * @return
	 */
	public String delBook() {
		List<Book> books = (List<Book>) JsonUtils.jsonToBeanList(bookJson, Book.class);

		// 返回信息
		CommonMsg cg = new CommonMsg();

		if (books.size() > 0) {
			for (Book b : books) {
				System.out.println(b.getISBN());
				if(b.getBookItems() != null){
					for(BookItem bookItem : b.getBookItems())
						bookItemService.delete(bookItem);
				}
				bookService.deleteBookByISBN(b.getISBN());
			}
			cg.setStatus("200");
			cg.setMessage("删除成功！");
			cg.setData("NULL");
			ActionContextUtils.setAtrributeToRequest("result", JsonUtils.beanToJson(cg));
		} else {
			cg.setStatus("-1");
			cg.setMessage("请选择要删除的书籍");
			cg.setData("NULL");
			ActionContextUtils.setAtrributeToRequest("result", JsonUtils.beanToJson(cg));
		}
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

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

}