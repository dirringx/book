package com.book.core.web.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.book.core.web.dao.BaseDao;
import com.book.core.web.service.BaseService;

@Transactional
public abstract class BaseServiceImpl<T>  implements BaseService<T> {
	
	private BaseDao<T> baseDao;
	
	public void setBaseDao(BaseDao<T> baseDao) {
		this.baseDao = baseDao;
	}
	
	/**
	 * 增
	 * 
	 * @param object
	 */
	public void add(T obj) {
		baseDao.add(obj);
	}
	
	/**
	 * 删
	 * 
	 * @param object
	 */
	public void delete(T obj) {
		baseDao.delete(obj);
	}
	
	/**
	 * 改
	 * 
	 * @param object
	 */
	public void update(T obj) {
		baseDao.update(obj);
	}
	
	/**
	 * 查
	 * 
	 * @param clazz
	 *            类型
	 * @param id
	 *            navite
	 * @return
	 */
	public T findByID(Class<T> clazz, int id) {
		return baseDao.findByID(clazz, id);
	}
	
	/**
	 * 查
	 * 
	 * @param clazz
	 *            类型
	 * @param id
	 *            uuid
	 * @return
	 */
	public T findByID(Class<T> clazz, String id) {
		return baseDao.findByID(clazz, id);
	}
	
	/**
	 * 查所有
	 * 
	 * @return
	 */
	public List<T> findAll(Class<T> clazz) {
		return baseDao.findAll(clazz);	
	}
	
}
