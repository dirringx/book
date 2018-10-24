package com.book.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.book.core.util.ActionContextUtils;
import com.book.core.web.action.BaseAction;
import com.book.pojos.Student;
import com.book.service.StudentService;

@SuppressWarnings("serial")
public class StudentActoin extends BaseAction{
	
	/** 日志记录类 **/
	public static Log logger = LogFactory.getLog(StudentActoin.class);
	
	/** studentService **/
	private StudentService studentService;
	
	private String password;
	
	public String index(){
		return "success"; 
	}
	
	public String show(){
		try{
			List<Student> students = studentService.findStudentByPermission("1");
			System.out.println(students.size());
		}catch (Exception e) {
		}
		return "success";
	}
	
	public String update(){
		Student s = (Student) ActionContextUtils.getContext().getApplication().get("student");
		s.setPassword(this.password);
		studentService.update(s);
		return "success";
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