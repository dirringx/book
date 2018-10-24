package com.book.service;

import java.util.List;

import com.book.core.web.service.BaseService;
import com.book.pojos.Student;

public interface StudentService extends BaseService<Student> {

	/**
	 * 查找一个班级的所有学生
	 * 
	 * @param studentClass
	 *            学生所在班级
	 * @return
	 */
	public List<Student> findStudentByclass(String studentClass);

	/**
	 * 通过学号和密码验证登陆
	 * 
	 * @param studentID
	 *            学号
	 * @param password
	 *            密码
	 * @return
	 */
	public Student findStudentBystudentIDAndPwd(String studentID, String password);

	/**
	 * 通过学号查找学生信息
	 * 
	 * @param studentID
	 *            学号
	 * @return
	 */
	public Student findStudentBystudentID(String studentID);

	/**
	 * 查询学生授权信息
	 * 
	 * @param permission
	 * @return
	 */
	public List<Student> findStudentByPermission(String permission);
}
