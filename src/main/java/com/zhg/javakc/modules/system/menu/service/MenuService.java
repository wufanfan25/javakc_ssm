package com.zhg.javakc.modules.system.menu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhg.javakc.base.page.Page;
import com.zhg.javakc.base.service.BaseService;
import com.zhg.javakc.base.util.CommonUtil;
import com.zhg.javakc.modules.system.menu.dao.MenuDao;
import com.zhg.javakc.modules.system.menu.entity.MenuEntity;

/**
 * 基础用户信息模块逻辑层实现
 * @author zhou
 * @version 0.1
 */
@Service
@Transactional(readOnly = true)
public class MenuService extends BaseService<MenuDao, MenuEntity>{
	
	@Autowired
	private MenuDao menuDao;
	
	public Page<MenuEntity> findMenu(Page<MenuEntity> page, MenuEntity entity) {
		// 执行分页查询
		page.setList(menuDao.findList(entity));
		return page;
	}
	
	/**
	 * 保存数据（插入）
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void save(MenuEntity entity) {
		entity.setMenuId( CommonUtil.uuid() );
		dao.insert(entity);
	}
	
	/**
	 * 主页初始化数据
	 * @return
	 */
	public List<Map<String, Object>> findList()
	{
		return menuDao.findAll();
	}
	
	/**
	 * 删除数据 (批量删除数据)
	 * @param id
	 */
	@Transactional(readOnly = false)
	public void delete(String[] id) {
		menuDao.deleteRelation(id);
		menuDao.delete(id);
	}
	
}
