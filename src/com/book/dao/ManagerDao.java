package com.book.dao;

import com.book.core.web.dao.BaseDao;
import com.book.pojos.Manager;

public interface ManagerDao extends BaseDao<Manager> {

	/**
	 * 通过工号查找管理员或者教务员信息
	 * 
	 * @param workNumber
	 *            工号
	 * @return
	 */
	Manager findManagerBywordNumber(String workNumber);
}
