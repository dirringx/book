package com.book.core.web.service.impl;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.book.core.web.dao.BaseDao;
import com.book.core.web.service.BaseService;

/**
 * 
 * 用于基本DB操作的service接口的实现类 <br>
 * 
 * 本类提供了对于接口<tt>BaseService</tt>的一个骨架实现，它实现了<tt>BaseService</tt>接口。
 * 开发过程中，针对一个dao，为了实现save、update、delete、findByID、findAll等相应的DB操作时，
 * 进而需要实现<tt>BaseService</tt>接口的时候可以直接继承本类，而不需要再去实现一次接口。
 * 
 */
@SuppressWarnings("unchecked")
public abstract class BaseServiceImpl<T> implements BaseService<T> {

	@Autowired
	private BaseDao<T> baseDao;

	private Class<T> clazz = null;

	public BaseServiceImpl() {
		ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
		clazz = (Class<T>) pt.getActualTypeArguments()[0];
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
		return baseDao.findByID(this.clazz, id);
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
		return baseDao.findByID(this.clazz, id);
	}

	/**
	 * 查所有
	 * 
	 * @return
	 */
	public List<T> findAll(Class<T> clazz) {
		return baseDao.findAll(this.clazz);
	}

}
