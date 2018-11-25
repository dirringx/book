package com.book.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.book.service.BookItemService;
import com.book.service.BookService;
import com.book.service.CourseService;
import com.book.core.util.ActionContextUtils;
import com.book.core.web.action.BaseAction;
import com.book.pojos.Book;
import com.book.pojos.BookItem;
import com.book.pojos.Course;
import com.opensymphony.xwork2.ModelDriven;

public class BookTypeAction extends BaseAction implements ModelDriven<Course> {
	private static final long serialVersionUID = 1L;

	@Resource(name = "courseService")
	private CourseService courseService;

	@Resource(name = "bookService")
	private BookService bookService;

	@Resource(name = "bookItemService")
	private BookItemService bookItemService;

	private Course course;

	public Course getModel() {
		if (course == null)
			course = new Course();
		return course;
	}

	/**
	 * 通过专业和年级查找书籍
	 * 
	 * @return
	 */
	public String find() {
		ActionContextUtils.removeAttrFromSession("books");
		List<Book> books = new ArrayList<Book>();
		List<Course> courses = courseService.findCourseByGradeAndMajor(course.getGrade(), course.getMajor());
		for (Course c : courses) {
			List<BookItem> bookItems = bookItemService.findByCourseID(c.getId());
			if (bookItems.size() == 0)
				continue;
			for (BookItem bt : bookItems) {
				if(bt.getBook() != null){
					books.add(bt.getBook());
				}else{
					bookItemService.delete(bt);
				}
			}
		}
		ActionContextUtils.setAttributeToSession("books", books);
		return "book";
	}
}
