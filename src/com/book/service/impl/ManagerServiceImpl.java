package com.book.service.impl;

import com.book.core.web.service.impl.BaseServiceImpl;
import com.book.dao.ManagerDao;
import com.book.pojos.Manager;
import com.book.service.ManagerService;

public class ManagerServiceImpl extends BaseServiceImpl<Manager> implements ManagerService{

	private ManagerDao managerDao;
	
	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}
	
	public Manager findManagerBywordNumber(String workNumber) {
		return managerDao.findManagerBywordNumber(workNumber);
	}

}
