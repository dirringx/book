package com.book.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.book.core.web.action.BaseAction;
import com.book.service.ManagerService;

@Controller(value = "managerAction")
@Scope(value = "prototype")
public class ManagerAction extends BaseAction {
	private static final long serialVersionUID = 1L;

	@Resource(name = "managerService")
	private ManagerService managerService;

	public String toLogin() {
		return "toLogin";
	}

	public String index() {
		return SUCCESS;
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
}