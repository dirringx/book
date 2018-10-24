package com.book.login;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.book.core.util.ActionContextUtils;
import com.book.core.util.ExceptionUtils;
import com.book.core.util.MD5;
import com.book.core.util.StringUtils;
import com.book.core.web.action.BaseAction;
import com.book.pojos.Manager;
import com.book.pojos.Student;
import com.book.service.ManagerService;
import com.book.service.StudentService;

@SuppressWarnings("serial")
public class LoginAction extends BaseAction {

	/** 日志记录类 **/
	public static Log logger = LogFactory.getLog(LoginAction.class);

	/** 登陆页面 **/
	private static final String LOGIN = "toLogin";

	/** 默认登录首页 **/
	private static final String INDEX = "main";

	/** studentService **/
	private StudentService studentService;

	/** managerService **/
	private ManagerService managerService;

	/** 工号/学号 **/
	private String userName;

	/** 密码 **/
	private String password;

	/** 用户类型 **/
	private String userType;
	
	public String toLogin() {
		return LOGIN;
	}

	/**
	 * 用户登录
	 */
	public String login() {
		// 回传字符串
		String result = LOGIN;
		try {
			if (StringUtils.isEmpty(this.userName)) {
				ActionContextUtils.setAtrributeToRequest("msg", "账号不能为空或者出现非法字符!");
				return LOGIN;
			}
			if (StringUtils.isEmpty(this.password)) {
				ActionContextUtils.setAtrributeToRequest("msg", "密码不能为空或者出现非法字符!");
				return LOGIN;
			}
			//学生登陆
			if (this.userType == null) {
				Student student = studentService.findStudentBystudentID(this.userName);
				if (student == null) {
					ActionContextUtils.setAtrributeToRequest("msg", "账号不存在!");
					return LOGIN;
				}
				// 验证密码
				if (!new MD5().getMD5ofStr(this.password).equals(student.getPassword())) {
					ActionContextUtils.setAtrributeToRequest("msg", "密码错误!");
					return LOGIN;
				} else {
					// 用户登陆保存信息
					ActionContextUtils.setAttributeToSession("student", student);
					return SUCCESS;
				}
			} 
			//管理员登陆
			else {
				Manager manager = managerService.findManagerBywordNumber(this.userName);
				if (manager == null) {
					ActionContextUtils.setAtrributeToRequest("msg", "管理员账号不存在!");
					return LOGIN;
				}
				// 验证密码
				if (!new MD5().getMD5ofStr(this.password).equals(manager.getPassword())) {
					ActionContextUtils.setAtrributeToRequest("msg", "密码错误!");
					return LOGIN;
				} else {
					// 用户登陆保存信息
					ActionContextUtils.setAttributeToSession("manager", manager);
					
					if("1".equals(this.userType))
						return SUCCESS;
					
					if("2".equals(this.userType)){
						return "mam";
					}
				}
			}
		} catch (Exception ex) {
			String event = ExceptionUtils.formatStackTrace(ex);
			logger.error(event);
		}
		return result;
	}

	/**
	 * 用户登出
	 */
	public String logout() {
		ActionContextUtils.removeAttrFromSession("student");
		ActionContextUtils.removeAttrFromSession("manager");
		return INDEX;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
}