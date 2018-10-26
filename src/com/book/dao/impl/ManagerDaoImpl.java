package com.book.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.book.core.web.dao.impl.BaseDaoImpl;
import com.book.dao.ManagerDao;
import com.book.pojos.Manager;

@Repository(value="managerDao")
public class ManagerDaoImpl extends BaseDaoImpl<Manager> implements ManagerDao {

	public Manager findManagerBywordNumber(String workNumber) {
		String hql = "from Manager m where m.workNumber = ?";
		List<Manager> managers = (List<Manager>) this.getHibernateTemplate().find(hql, workNumber);
		if (managers == null || managers.isEmpty())
			return null;
		return managers.get(0);
	}
}
