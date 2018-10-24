package com.book.action;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.book.core.util.ActionContextUtils;
import com.book.core.web.action.BaseAction;
import com.book.pojos.Student;
import com.book.service.StudentService;

@SuppressWarnings("serial")
public class StudentActoin extends BaseAction {

	/** 日志记录类 **/
	public static Log logger = LogFactory.getLog(StudentActoin.class);

	/** studentService **/
	private StudentService studentService;

	private String password;

	/**
	 * 学生个人中心
	 * 
	 * @return
	 */
	public String index() {
		Student student = (Student) ActionContextUtils.getAttribute("student", "session");
		// 没有学生用户的session缓存信息返回登陆界面
		if (student == null)
			return "login";
		return SUCCESS;
	}

	/**
	 * 修改密码
	 * 
	 * @return
	 */
	public String update() {
		Student s = (Student) ActionContextUtils.getContext().getApplication().get("student");
		s.setPassword(this.password);
		studentService.update(s);
		return SUCCESS;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
}