package com.book.dao.impl;

import java.util.List;

import com.book.core.web.dao.impl.BaseDaoImpl;
import com.book.dao.StudentDao;
import com.book.pojos.Student;

@SuppressWarnings("unchecked")
public class StudentDaoImpl extends BaseDaoImpl<Student> implements StudentDao {

	public List<Student> findStudentByclass(String studentClass) {
		String hql = "from Student s where s.studentClass = ?";
		List<Student> students = (List<Student>) this.getHibernateTemplate().find(hql, studentClass);
		if (students == null || students.isEmpty())
			return null;
		return students;
	}

	public Student findStudentBystudentIDAndPwd(String studentID, String password) {
		String hql = "from Student s where s.studentID = ? and s.password = ?";
		List<Student> students = (List<Student>) this.getHibernateTemplate().find(hql, studentID, password);
		if (students == null || students.isEmpty())
			return null;
		return students.get(0);
	}

	public Student findStudentBystudentID(String studentID) {
		String hql = "from Student s where s.studentID = ?";
		List<Student> students = (List<Student>) this.getHibernateTemplate().find(hql, studentID);
		if (students == null || students.isEmpty())
			return null;
		return students.get(0);
	}

	public List<Student> findStudentByPermission(String permission) {
		String hql = "from Student s where s.permission = ?";
		List<Student> students = (List<Student>) this.getHibernateTemplate().find(hql, permission);
		if(students == null || students.isEmpty())
			return null;
		return students;
	}
}
