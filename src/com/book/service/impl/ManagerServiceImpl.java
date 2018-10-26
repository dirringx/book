package com.book.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.book.core.web.service.impl.BaseServiceImpl;
import com.book.dao.ManagerDao;
import com.book.pojos.Manager;
import com.book.service.ManagerService;

@Service(value="managerService")
public class ManagerServiceImpl extends BaseServiceImpl<Manager> implements ManagerService{

	@Resource(name="managerDao")
	private ManagerDao managerDao;
	
	public Manager findManagerBywordNumber(String workNumber) {
		return managerDao.findManagerBywordNumber(workNumber);
	}

}
