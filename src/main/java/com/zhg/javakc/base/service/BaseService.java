package com.zhg.javakc.base.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.zhg.javakc.base.dao.BaseDao;
import com.zhg.javakc.base.entity.BaseEntity;

/**
 * 基础逻辑层实现类
 * @author zhou
 * @version v0.1
 * @param <D>
 * @param <T>
 */
@Transactional(readOnly = true)
public class BaseService<D extends BaseDao<T>, T extends BaseEntity<T>> {
	
	@Autowired
	protected D dao;
	/**
	 * 获取单条数据
	 * @param id
	 * @return
	 */
	public T get(String id) {
		return dao.get(id);
	}
	
	/**
	 * 获取单条数据
	 * @param entity
	 * @return
	 */
	public T get(T entity) {
		return dao.get(entity);
	}
	
	/**
	 * 查询列表数据
	 * @param entity
	 * @return
	 */
	public List<T> findList(T entity) {
		return dao.findList(entity);
	}
	
	/**
	 * 保存数据（插入）
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void save(T entity) {
		entity.setNewRecord(true);
		dao.insert(entity);
	}
	
	/**
	 * 保存数据（更新）
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void update(T entity) {
		dao.update(entity);
	}
	
	/**
	 * 删除数据
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void delete(T entity) {
		dao.delete(entity);
	}
	
	/**
	 * 删除数据 (批量删除数据)
	 * @param id
	 */
	@Transactional(readOnly = false)
	public void delete(String[] id) {
		dao.delete(id);
	}
}
