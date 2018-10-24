package com.book.service;

import com.book.core.web.service.BaseService;
import com.book.pojos.Manager;

public interface ManagerService extends BaseService<Manager>{
	
	
	public Manager findManagerBywordNumber(String workNumber);
}
