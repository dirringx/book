package com.book.test;

import java.util.Date;

import javax.annotation.Resource;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.book.core.util.MD5;
import com.book.dao.BookDao;
import com.book.dao.BookItemDao;
import com.book.dao.CourseDao;
import com.book.dao.ManagerDao;
import com.book.dao.OrderDao;
import com.book.dao.OrderItemDao;
import com.book.dao.StudentDao;
import com.book.pojos.Book;
import com.book.pojos.BookItem;
import com.book.pojos.Course;
import com.book.pojos.Manager;
import com.book.pojos.Student;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestDemo extends AbstractJUnit4SpringContextTests {

	@Resource(name = "courseDao")
	private CourseDao courseDao;

	@Resource(name = "bookDao")
	private BookDao bookDao;

	@Resource(name = "studentDao")
	private StudentDao studentDao;

	@Resource(name = "bookItemDao")
	private BookItemDao bookItemDao;

	@Resource(name = "orderDao")
	private OrderDao orderDao;

	@Resource(name = "managerDao")
	private ManagerDao managerDao;

	@Resource(name = "orderItemDao")
	private OrderItemDao orderItemDao;

	
	public void Init() {
		testAddManager();
		testAddStudent();
		testAddBook();
		test1BookToNCourse();
	}

	
	public void testAddManager() {
		Manager manager = new Manager("admin", "20161001", new MD5().getMD5ofStr("123456"), 1);
		managerDao.add(manager);
		manager = new Manager("admin", "20161002", new MD5().getMD5ofStr("123456"), 2);
		managerDao.add(manager);
	}

	public void testAddStudent() {
		Student stu = new Student();
		stu.setStudentName("stu000");
		stu.setStudentID("201610098000");
		stu.setPassword(new MD5().getMD5ofStr("201610098000"));
		stu.setMajor("软件工程");
		stu.setGrade("2016");
		stu.setCollege("计算机工程学院");
		stu.setStudentClass("5");
		stu.setPermission("1");
		studentDao.add(stu);

		stu.setStudentName("stu001");
		stu.setStudentID("201610098001");
		stu.setPassword(new MD5().getMD5ofStr("201610098001"));
		stu.setMajor("计算机科学与技术");
		stu.setGrade("2016");
		stu.setCollege("计算机工程学院");
		stu.setStudentClass("6");
		stu.setPermission("");
		studentDao.add(stu);

		stu.setStudentName("stu002");
		stu.setStudentID("201610098002");
		stu.setPassword(new MD5().getMD5ofStr("201610098002"));
		stu.setMajor("网络工程");
		stu.setGrade("2016");
		stu.setCollege("计算机工程学院");
		stu.setStudentClass("1");
		stu.setPermission("");
		studentDao.add(stu);

		stu.setStudentName("stu003");
		stu.setStudentID("201610098003");
		stu.setPassword(new MD5().getMD5ofStr("201610098003"));
		stu.setMajor("信息与计算科学");
		stu.setGrade("2016");
		stu.setCollege("计算机工程学院");
		stu.setStudentClass("1");
		stu.setPermission("");
		studentDao.add(stu);

		stu.setStudentName("stu004");
		stu.setStudentID("201610098004");
		stu.setPassword(new MD5().getMD5ofStr("201610098004"));
		stu.setMajor("软件工程");
		stu.setGrade("2016");
		stu.setCollege("计算机工程学院");
		stu.setStudentClass("5");
		studentDao.add(stu);
	}

	public void testAddBook() {
		BookItem bookItem = new BookItem();
		Course course = new Course();

		Book book = new Book("978-7-3021-3112-5", "第一行代码:Android(第2版)", "郭霖", 79f, 60.4f, "Android", "img/book.jpg",
				"人民邮电出版社");
		course = new Course("Android UI设计", "计算机科学与技术", "计算机工程学院", "2016", new Date(), new Date());
		courseDao.add(course);
		bookItem.setBook(book);
		bookItem.setCourse(course);
		book.getBookItems().add(bookItem);
		bookDao.add(book);

		book = new Book("978-7-5165-1661-4", "概率论与数理统计", "阳平华", 39.8f, 30.248f, "数学", "img/book.jpg", "航空工业出版社");
		course = new Course("概率论与数理统计A", "软件工程", "计算机工程学院", "2016", new Date(), new Date());
		courseDao.add(course);
		bookItem = new BookItem();
		bookItem.setBook(book);
		bookItem.setCourse(course);
		book.getBookItems().add(bookItem);
		bookDao.add(book);

		book = new Book("978-7-5165-1600-4", "JavaEE框架应用开发", "QST青软", 34.5f, 24.5f, "ssh", "img/book.jpg", "清华大学出版社");
		course = new Course("javaEE框架应用与开发", "软件工程", "计算机工程学院", "2016", new Date(), new Date());
		courseDao.add(course);
		bookItem = new BookItem();
		bookItem.setBook(book);
		bookItem.setCourse(course);
		book.getBookItems().add(bookItem);
		bookDao.add(book);

		book = new Book("978-4-5678-9123-4", "UML2基础、建模与设计教程", "杨弘平", 34.5f, 24.5f, "软件工程书籍", "img/book.jpg",
				"清华大学出版社");
		course = new Course("UML建模分析与设计", "软件工程", "计算机工程学院", "2016", new Date(), new Date());
		courseDao.add(course);
		bookItem = new BookItem();
		bookItem.setBook(book);
		bookItem.setCourse(course);
		book.getBookItems().add(bookItem);
		bookDao.add(book);

		book = new Book("978-7-5678-9123-2", "计算机操作系统（第二版）", "郁红英、王磊、武磊、李春强", 34.5f, 24.5f, "计算机专业书籍", "img/book.jpg",
				"清华大学出版社");
		course = new Course("操作系统", "软件工程", "计算机工程学院", "2016", new Date(), new Date());
		courseDao.add(course);
		bookItem = new BookItem();
		bookItem.setBook(book);
		bookItem.setCourse(course);
		book.getBookItems().add(bookItem);
		bookDao.add(book);

		book = new Book("978-7-1111-9123-2", "编译原理（第3版）", "王生原 董渊 张素琴 吕映芝 蒋维杜", 49f, 33f, "计算机专业书籍", "img/book.jpg",
				"清华大学出版社");
		course = new Course("编译原理", "软件工程", "计算机工程学院", "2016", new Date(), new Date());
		courseDao.add(course);
		bookItem = new BookItem();
		bookItem.setBook(book);
		bookItem.setCourse(course);
		book.getBookItems().add(bookItem);
		bookDao.add(book);

		book = new Book("123-4-5678-9023-4", "人机交互基础教程（第3版）", "孟祥旭、李学庆、杨承磊、王璐", 49f, 33f, "计算机专业书籍", "img/book.jpg",
				"清华大学出版社");
		course = new Course("交互技术基础", "计算机科学与技术", "计算机工程学院", "2016", new Date(), new Date());
		courseDao.add(course);
		bookItem = new BookItem();
		bookItem.setBook(book);
		bookItem.setCourse(course);
		book.getBookItems().add(bookItem);
		bookDao.add(book);

		book = new Book("978-4-5678-9103-4", "Cocos2d-x游戏开发实战精解", "欧桐桐", 49f, 33f, "计算机专业书籍", "img/book.jpg",
				"清华大学出版社");
		course = new Course("二维游戏开发", "计算机科学与技术", "计算机工程学院", "2016", new Date(), new Date());
		courseDao.add(course);
		bookItem = new BookItem();
		bookItem.setBook(book);
		bookItem.setCourse(course);
		book.getBookItems().add(bookItem);
		bookDao.add(book);
	}

	public void test1BookToNCourse() {
		Book book = new Book();
		book.setAuthor("肖来元");
		book.setBookImage("img/book.jpg");
		book.setDescription("本书系统讲述软件项目管理的基本概念、基本原理及基本方法，包含当前相关知识领域的最新发展概况。");
		book.setISBN("978-7-3021-3052-5");
		book.setName("软件项目管理与案例分析（第2版）");
		book.setDiscount(20f);
		book.setPrice(29f);
		book.setPress("清华大学出版社");

		Course course = new Course();
		course.setName("软件项目管理");
		course.setGrade("2016");
		course.setMajor("软件工程");
		course.setCollege("计算机工程学院");
		course.setCreateTime(new Date());
		course.setUpdateDate(new Date());
		courseDao.add(course);

		Course course1 = new Course();
		course1.setName("软件项目管理");
		course1.setGrade("2016");
		course1.setMajor("计算机科学与技术");
		course1.setCollege("计算机工程学院");
		course1.setCreateTime(new Date());
		course1.setUpdateDate(new Date());
		courseDao.add(course1);

		BookItem bookItem = new BookItem();
		bookItem.setBook(book);
		bookItem.setCourse(course);

		BookItem bookItem1 = new BookItem();
		bookItem1.setBook(book);
		bookItem1.setCourse(course1);

		book.getBookItems().add(bookItem);
		book.getBookItems().add(bookItem1);
		bookDao.add(book);

		Book b = bookDao.findBookByISBN("978-7-3021-3052-5");

		Course course2 = new Course();
		course2.setName("软件项目管理");
		course2.setGrade("2016");
		course2.setMajor("信息与计算科学");
		course2.setCollege("计算机工程学院");
		course2.setCreateTime(new Date());
		course2.setUpdateDate(new Date());
		courseDao.add(course2);

		BookItem bookItem2 = new BookItem();
		bookItem2.setBook(b);
		bookItem2.setCourse(course2);
		b.getBookItems().add(bookItem2);
		bookDao.update(b);
	}
}
