package com.book.dao;

import java.util.List;

import com.book.core.web.dao.BaseDao;
import com.book.pojos.Student;

public interface StudentDao extends BaseDao<Student> {

	/**
	 * 查找一个班级的所有学生
	 * 
	 * @param studentClass
	 *            学生所在班级
	 * @return
	 */
	List<Student> findStudentByclass(String studentClass);

	/**
	 * 通过学号和密码验证登陆
	 * 
	 * @param studentID
	 *            学号
	 * @param password
	 *            密码
	 * @return
	 */
	Student findStudentBystudentIDAndPwd(String studentID, String password);

	/**
	 * 通过学号查找学生信息
	 * 
	 * @param studentID
	 *            学号
	 * @return
	 */
	Student findStudentBystudentID(String studentID);

	/**
	 * 查询学生授权信息
	 * 
	 * @param permission
	 *            权限
	 * @return
	 */
	List<Student> findStudentByPermission(String permission);
	
	Student findStudentByPermission(String id, String permission);
}
