package com.book.core.web.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.book.core.web.dao.BaseDao;

@Transactional
@SuppressWarnings("unchecked")
public abstract class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T> {

	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	/**
	 * 增
	 * 
	 * @param object
	 */
	public void add(T obj) {
		this.getHibernateTemplate().save(obj);
	}

	/**
	 * 删
	 * 
	 * @param object
	 */
	public void delete(T obj) {
		this.getHibernateTemplate().delete(obj);
	}

	/**
	 * 改
	 * 
	 * @param object
	 */
	public void update(T obj) {
		this.getHibernateTemplate().update(obj);
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
		return this.getHibernateTemplate().get(clazz, id);
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
		return this.getHibernateTemplate().get(clazz, id);
	}

	/**
	 * 查所有
	 * 
	 * @return
	 */
	public List<T> findAll(Class<T> clazz) {
		StringBuffer hql = new StringBuffer("from ").append(clazz.getSimpleName());
		return (List<T>) this.getHibernateTemplate().find(hql.toString());
	}
}
