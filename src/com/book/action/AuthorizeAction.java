package com.book.action;

import java.util.List;

import javax.annotation.Resource;

import com.book.core.util.ActionContextUtils;
import com.book.core.util.StringUtils;
import com.book.core.web.action.BaseAction;
import com.book.pojos.Student;
import com.book.service.StudentService;

public class AuthorizeAction extends BaseAction {
	private static final long serialVersionUID = 1L;

	@Resource(name = "studentService")
	private StudentService studentService;

	private String studentID;

	public String show() {
		List<Student> students = studentService.findStudentByPermission("1");
		ActionContextUtils.setAtrributeToRequest("stu", students);
		return SUCCESS;
	}

	/**
	 * 授权
	 * 
	 * @return
	 */
	public String auth() {
		// 检查输入信息
		if (StringUtils.isEmpty(this.studentID)) {
			ActionContextUtils.setAtrributeToRequest("msg", "查询内容不能为空");
			return this.show();
		}
		Student student = studentService.findStudentBystudentID(this.studentID);
		if (student == null) {
			ActionContextUtils.setAtrributeToRequest("msg", "没有该学生用户信息");
			return this.show();
		}
		System.out.println(studentID);
		student.setPermission("1");
		studentService.update(student);
		return this.show();
	}

	/**
	 * 取消授权
	 * 
	 * @return
	 */
	public String noAuth() {
		Student student = studentService.findStudentBystudentID(this.studentID);
		if (student == null) {
			ActionContextUtils.setAtrributeToRequest("msg", "没有该学生用户信息");
			return this.show();
		}
		student.setPermission("0");
		studentService.update(student);
		return this.show();
	}

	public String getStudentID() {
		return studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}
}