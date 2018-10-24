package com.book.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;

import com.book.core.util.JsonUtils;
import com.book.core.util.MD5;
import com.book.dao.BookDao;
import com.book.dao.BookTypeDao;
import com.book.dao.StudentDao;
import com.book.pojos.Book;
import com.book.pojos.BookType;
import com.book.pojos.Student;
import com.book.service.BookService;

@ContextConfiguration("classpath:applicationContext.xml")
public class TestDao extends AbstractTransactionalJUnit4SpringContextTests {

	@Resource(name = "studentDao")
	private StudentDao studentDao;

	@Resource(name = "bookTypeDao")
	private BookTypeDao bookTypeDao;

	@Resource(name = "bookDao")
	private BookDao bookDao;
	
	@Resource(name = "bookService")
	private BookService bookService;

	@Test
	public void test() {
		System.out.println(bookService.toString());
		System.out.println(studentDao.toString());
		System.out.println(bookTypeDao.toString());
		System.out.println(bookDao.toString());
	}

	public void testStudentDao() {
		String name = "201610098233";
		String pwd = new MD5().getMD5ofStr("201610098233");
		Student student = studentDao.findStudentBystudentIDAndPwd(name, pwd);
		System.out.println(student.getGrade());
		System.out.println(student.getStudentClass());
	}

	@Test
	public void testBookDao() {
		Book book = new Book();
		BookType bookType = bookTypeDao.findByID(BookType.class, 1);
		System.out.println(JsonUtils.beanToJson(bookType));
		book.setBookType(bookType);
		book.setPrice(34.5f);
		book.setDiscount(33.3f);
		book.setAuthor("杨弘平");
		book.setBookImage("img/book.jpg");
		book.setDescription("计算机书籍");
		book.setClassName("UML");
		book.setPress("清华大学出版社");
		book.setName("UML2 基础、建模与设计教程");
		book.setISBN("978-7-302-40449-1");
		System.out.println(JsonUtils.beanToJson(book));
		bookDao.add(book);
	}
}
