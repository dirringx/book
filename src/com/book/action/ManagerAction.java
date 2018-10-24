package com.book.action;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.book.core.web.action.BaseAction;
import com.book.pojos.BookType;
import com.book.service.ManagerService;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings({ "serial", "unused" })
public class ManagerAction extends BaseAction{

	/** 日志记录类 **/
	public static Log logger = LogFactory.getLog(ManagerAction.class);

	/** managerService **/
	private ManagerService managerService;
	
	public String index(){
		return "success";
	}
	
	public String book(){
		return "book";
	}

	public String authorize(){
		return "authorize";
	}
	
	public String order(){
		return "order";
	}
	
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}
}