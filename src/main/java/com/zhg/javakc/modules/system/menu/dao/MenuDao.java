package com.zhg.javakc.modules.system.menu.dao;

import java.util.List;
import java.util.Map;

import com.zhg.javakc.base.dao.BaseDao;
import com.zhg.javakc.base.dao.MyBatisDao;
import com.zhg.javakc.modules.system.menu.entity.MenuEntity;

/**
 * 基础菜单信息模块数据层实现
 * @author zhou
 * @version 0.1
 */
@MyBatisDao
public interface MenuDao extends BaseDao<MenuEntity>{
	
	public List<Map<String, Object>> findAll();
	
	public int deleteRelation(String[] id);
	
}
