package com.book.login;

import javax.annotation.Resource;

import com.book.core.util.ActionContextUtils;
import com.book.core.util.MD5;
import com.book.core.util.StringUtils;
import com.book.core.web.action.BaseAction;
import com.book.pojos.Student;
import com.book.service.StudentService;
import com.opensymphony.xwork2.ModelDriven;

public class StudentLoginAction extends BaseAction implements ModelDriven<Student> {
	private static final long serialVersionUID = 1L;

	@Resource(name = "studentService")
	private StudentService studentService;

	/** 登陆页面 **/
	private static final String LOGIN = "toLogin";

	/** 默认登录首页 **/
	private static final String INDEX = "main";

	private Student student;

	@Override
	public Student getModel() {
		if (student == null)
			student = new Student();
		return student;
	}

	public String toLogin() {
		return LOGIN;
	}

	/**
	 * 用户登录
	 */
	public String login() {
		
		// 验证输入合法性
		if (StringUtils.isEmpty(student.getStudentName())) {
			ActionContextUtils.setAtrributeToRequest("msg", "账号不能为空或者出现非法字符!");
			return LOGIN;
		}
		if (StringUtils.isEmpty(student.getPassword())) {
			ActionContextUtils.setAtrributeToRequest("msg", "密码不能为空或者出现非法字符!");
			return LOGIN;
		}
		
		// 获取学生信息
		Student stu = studentService.findStudentBystudentID(student.getStudentName());

		if (stu == null) {
			ActionContextUtils.setAtrributeToRequest("msg", "账号不存在!");
			return LOGIN;
		}

		// 验证密码
		if (!new MD5().getMD5ofStr(student.getPassword()).equals(stu.getPassword())) {
			ActionContextUtils.setAtrributeToRequest("msg", "密码错误!");
			return LOGIN;
		}

		// 用户登陆保存信息
		ActionContextUtils.setAttributeToSession("student", stu);
		return SUCCESS;
	}

	/**
	 * 用户登出
	 */
	public String logout() {
		ActionContextUtils.removeAttrFromSession("student");
		return INDEX;
	}
}