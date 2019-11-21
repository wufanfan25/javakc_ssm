package com.zhg.javakc.modules.system.role.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhg.javakc.base.page.Page;
import com.zhg.javakc.base.service.BaseService;
import com.zhg.javakc.base.util.CommonUtil;
import com.zhg.javakc.modules.system.role.dao.RoleDao;
import com.zhg.javakc.modules.system.role.entity.RoleEntity;

/**
 * 基础信息角色模块逻辑层实现
 * @author zhou
 * @version 0.1
 */
@Service
@Transactional(readOnly = true)
public class RoleService extends BaseService<RoleDao, RoleEntity>{
	
	@Autowired
	private RoleDao roleDao;
	
	public Page<RoleEntity> findRole(Page<RoleEntity> page, RoleEntity entity) {
		// 设置分页参数
		entity.setPage(page);
		// 执行分页查询
		page.setList(roleDao.findList(entity));
		return page;
	}
	
	@Transactional(readOnly = false)
	public void save(RoleEntity entity, String[] ids)
	{
		String roleId = CommonUtil.uuid();
		entity.setRoleId( roleId );
		roleDao.insert(entity);
		
		for(String menuId:ids)
		{
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("roleId", roleId);
			data.put("menuId", menuId);
			roleDao.insertRelation(data);
		}
	}
	
	@Transactional(readOnly = false)
	public void update(RoleEntity entity, String[] ids)
	{
		roleDao.update(entity);
		
		roleDao.deleteRelation(entity.getRoleId());
		
		for(String menuId:ids)
		{
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("roleId", entity.getRoleId());
			data.put("menuId", menuId);
			roleDao.insertRelation(data);
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(String[] id) {
		for(String roleId: id)
		{
			roleDao.deleteRelation(roleId);
		}
		dao.delete(id);
	}
	
}
