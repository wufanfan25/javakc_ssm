package com.zhg.javakc.modules.system.user.dao;

import com.zhg.javakc.base.dao.BaseDao;
import com.zhg.javakc.base.dao.MyBatisDao;
import com.zhg.javakc.modules.system.user.entity.UserEntity;

import java.util.Map;

/**
 * 基础用户信息模块数据层实现
 * @author zhou
 * @version 0.1
 */
@MyBatisDao
public interface UserDao extends BaseDao<UserEntity>{
	
	public int insert(UserEntity entity);
	
	public void insertRelation(Map<String, Object> data);
	
	public void deleteRelation(String userId);
	
	public String login(String loginName);
	
	public UserEntity findByName(String loginName);

}
