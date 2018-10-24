package com.book.core.web.dao;

import java.util.List;

public interface BaseDao<T> {

	/**
	 * 增
	 * 
	 * @param object
	 */
	void add(T obj);

	/**
	 * 删
	 * 
	 * @param object
	 */
	void delete(T obj);

	/**
	 * 改
	 * 
	 * @param object
	 */
	void update(T obj);

	/**
	 * 查
	 * 
	 * @param clazz
	 *            类型
	 * @param id
	 *            uuid
	 * @return
	 */
	T findByID(Class<T> clazz, String id);

	/**
	 * 查
	 * 
	 * @param clazz
	 *            类型
	 * @param id
	 *            navite
	 * @return
	 */
	T findByID(Class<T> clazz, int id);

	/**
	 * 查所有
	 * 
	 * @return
	 */
	List<T> findAll(Class<T> clazz);
}
