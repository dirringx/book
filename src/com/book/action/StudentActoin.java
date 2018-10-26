package com.book.action;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.book.core.util.ActionContextUtils;
import com.book.core.web.action.BaseAction;
import com.book.pojos.Student;
import com.book.service.StudentService;

public class StudentActoin extends BaseAction {
	private static final long serialVersionUID = 1L;

	/** 日志记录类 **/
	public static Log logger = LogFactory.getLog(StudentActoin.class);

	@Resource(name = "studentService")
	private StudentService studentService;

	private String password;

	/**
	 * 学生个人中心
	 * 
	 * @return
	 */
	public String index() {
		// 没有学生用户的session缓存信息返回登陆界面
		if (ActionContextUtils.getAttribute("student", "session") == null)
			return "login";
		return SUCCESS;
	}

	/**
	 * 修改密码
	 * 
	 * @return
	 */
	public String update() {
		Student stu = (Student) ActionContextUtils.getContext().getApplication().get("student");
		if (stu != null) {
			stu.setPassword(this.password);
			studentService.update(stu);
		}
		return SUCCESS;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}