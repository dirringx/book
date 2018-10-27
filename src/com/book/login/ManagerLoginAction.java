package com.book.login;

import javax.annotation.Resource;

import com.book.core.util.ActionContextUtils;
import com.book.core.util.MD5;
import com.book.core.util.StringUtils;
import com.book.core.web.action.BaseAction;
import com.book.pojos.Manager;
import com.book.service.ManagerService;

import com.opensymphony.xwork2.ModelDriven;

public class ManagerLoginAction extends BaseAction implements ModelDriven<Manager> {
	private static final long serialVersionUID = 1L;

	@Resource(name = "managerService")
	private ManagerService managerService;

	/** 登陆页面 **/
	private static final String LOGIN = "toLogin";

	/** 教务员操作页面 **/
	private static final String JWY = "jwy";

	/** 管理员操作页面 **/
	private static final String GLY = "gly";

	private Manager manager;

	public String toLogin() {
		return LOGIN;
	}

	@Override
	public Manager getModel() {
		if (manager == null)
			manager = new Manager();
		return manager;
	}

	public String login() {
		// 验证输入合法性
		if (StringUtils.isEmpty(manager.getWorkNumber())) {
			ActionContextUtils.setAtrributeToRequest("msg", "账号不能为空或者出现非法字符!");
			return LOGIN;
		}
		if (StringUtils.isEmpty(manager.getPassword())) {
			ActionContextUtils.setAtrributeToRequest("msg", "密码不能为空或者出现非法字符!");
			return LOGIN;
		}

		// 获取管理员信息
		Manager m = managerService.findManagerBywordNumber(manager.getWorkNumber());
		if (m == null) {
			ActionContextUtils.setAtrributeToRequest("msg", "账号不存在!");
			return LOGIN;
		}

		// 检查权限
		if (m.getPermission() != manager.getPermission()) {
			ActionContextUtils.setAtrributeToRequest("msg", "没有权限!");
			return LOGIN;
		}

		// 验证密码
		if (!new MD5().getMD5ofStr(manager.getPassword()).equals(m.getPassword())) {
			ActionContextUtils.setAtrributeToRequest("msg", "密码错误!");
			return LOGIN;
		}

		// 用户登陆保存信息
		ActionContextUtils.setAttributeToSession("manager", m);

		switch (manager.getPermission()) {
		case 1:
			return JWY;
		case 2:
			return GLY;
		}
		return LOGIN;
	}

	/**
	 * 登出
	 */
	public String logout() {
		ActionContextUtils.removeAttrFromSession("manager");
		return LOGIN;
	}
}
