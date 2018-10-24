package com.book.core.web.service.impl;

import java.util.List;

import com.book.core.web.service.BaseService;

public abstract class BaseServiceImpl<T> implements BaseService<T> {

	/**
	 * 增
	 * 
	 * @param object
	 */
	public void add(T obj) {
		System.err.println("Please Override this method in BeanServiceImpl!");
	}

	/**
	 * 删
	 * 
	 * @param object
	 */
	public void delete(T obj) {
		System.err.println("Please Override this method in BeanServiceImpl!");
	}

	/**
	 * 改
	 * 
	 * @param object
	 */
	public void update(T obj) {
		System.err.println("Please Override this method in BeanServiceImpl!");
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
		System.err.println("Please Override this method in BeanServiceImpl!");
		return null;
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
		System.err.println("Please Override this method in BeanServiceImpl!");
		return null;
	}

	/**
	 * 查所有
	 * 
	 * @return
	 */
	public List<T> findAll(Class<T> clazz) {
		System.err.println("Please Override this method in BeanServiceImpl!");
		return null;
	}

}
