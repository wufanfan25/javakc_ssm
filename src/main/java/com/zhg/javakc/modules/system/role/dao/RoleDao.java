package com.zhg.javakc.modules.system.role.dao;

import java.util.Map;

import com.zhg.javakc.base.dao.BaseDao;
import com.zhg.javakc.base.dao.MyBatisDao;
import com.zhg.javakc.modules.system.role.entity.RoleEntity;

/**
 * 基础信息角色模块数据层实现
 * @author zhou
 * @version 0.1
 */
@MyBatisDao
public interface RoleDao extends BaseDao<RoleEntity>{
	
	public int insert(RoleEntity entity);
	
	public void insertRelation(Map<String, Object> data);
	
	public void deleteRelation(String roleId);
	
}
