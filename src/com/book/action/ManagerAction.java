package com.book.action;

import javax.annotation.Resource;

import com.book.core.util.ActionContextUtils;
import com.book.core.web.action.BaseAction;
import com.book.pojos.Student;
import com.book.service.StudentService;

public class ManagerAction extends BaseAction {
	private static final long serialVersionUID = 1L;

	@Resource(name = "studentService")
	private StudentService studentService;
	
	public String index() {
		return SUCCESS;
	}

	public String toLogin() {
		return "toLogin";
	}

	public String book() {
		return "book";
	}

	public String authorize() {
		return "authorize";
	}

	public String order() {
		return "order";
	}

	public String classManager() {
		Student student = (Student) ActionContextUtils.getAttribute("student", "session");
		if (student == null)
			return "login";
		
		if("1".equals(student.getPermission())){
			return "classOrder";
		}else{
			return "login";
		}
	}
}