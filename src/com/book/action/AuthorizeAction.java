package com.book.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.book.core.util.ActionContextUtils;
import com.book.core.web.action.BaseAction;
import com.book.pojos.Student;
import com.book.service.StudentService;

@SuppressWarnings("serial")
public class AuthorizeAction extends BaseAction {

	/** 日志记录类 **/
	public static Log logger = LogFactory.getLog(AuthorizeAction.class);

	private StudentService studentService;

	private String studentID;

	public void show() {
		try {
			List<Student> students = studentService.findStudentByPermission("1");
			ActionContextUtils.setAtrributeToRequest("stu", students);
		} catch (Exception e) {
		}
	}

	public String auth() {
		try {
			Student student = studentService.findStudentBystudentID(this.studentID);
			student.setPermission("1");
			studentService.update(student);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		this.show();
		return SUCCESS;
	}

	public String noAuth() {
		try {
			Student student = studentService.findStudentBystudentID(this.studentID);
			student.setPermission("0");
			studentService.update(student);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		this.show();
		return SUCCESS;
	}

	public String getStudentID() {
		return studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

}