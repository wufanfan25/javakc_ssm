package com.zhg.javakc.modules.system.home.dao;

import java.util.List;
import java.util.Map;

import com.zhg.javakc.base.dao.BaseDao;
import com.zhg.javakc.base.dao.MyBatisDao;
import com.zhg.javakc.modules.system.home.entity.HomeEntity;

/**
 * 首页信息模块数据层实现
 * @author zhou
 * @version 0.1
 */
@MyBatisDao
public interface HomeDao extends BaseDao<HomeEntity>{
	
	public List<Map<String, Object>> chart();
	
}
