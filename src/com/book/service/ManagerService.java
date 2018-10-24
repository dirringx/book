package com.book.service;

import com.book.core.web.service.BaseService;
import com.book.pojos.Manager;

public interface ManagerService extends BaseService<Manager>{
	/**
	 * 通过工号查找管理员或者教务员信息
	 * 
	 * @param workNumber
	 *            工号
	 * @return
	 */
	Manager findManagerBywordNumber(String workNumber);
}
