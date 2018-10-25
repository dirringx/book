package com.book.service.impl;

import java.util.List;

import com.book.core.web.service.impl.BaseServiceImpl;
import com.book.dao.StudentDao;
import com.book.pojos.Student;
import com.book.service.StudentService;

public class StudentServiceImpl extends BaseServiceImpl<Student>  implements StudentService {
	
	private StudentDao studentDao;

	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	
	@Override
	public void update(Student obj) {
		studentDao.update(obj);
	}
	
	public List<Student> findStudentByclass(String studentClass) {
		System.out.println(studentDao.toString());
		return studentDao.findStudentByclass(studentClass);
	}

	public Student findStudentBystudentIDAndPwd(String studentID, String password) {
		return studentDao.findStudentBystudentIDAndPwd(studentID, password);
	}

	public Student findStudentBystudentID(String studentID) {
		return studentDao.findStudentBystudentID(studentID);
	}

	public List<Student> findStudentByPermission(String permission) {
		return studentDao.findStudentByPermission(permission);
	}

}
