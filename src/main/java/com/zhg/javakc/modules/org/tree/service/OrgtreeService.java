package com.zhg.javakc.modules.org.tree.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhg.javakc.base.service.BaseService;
import com.zhg.javakc.base.util.CommonUtil;
import com.zhg.javakc.modules.org.tree.dao.OrgtreeDao;
import com.zhg.javakc.modules.org.tree.entity.OrgtreeEntity;

@Service
@Transactional(readOnly=true)
public class OrgtreeService extends BaseService<OrgtreeDao, OrgtreeEntity> {
	
	@Autowired
	private OrgtreeDao orgtreeDao;
	
	/**
	 * 查询列表数据
	 * @param entity
	 * @return
	 */
	public List<Map<String, Object>> findList() {
		//查询所有结构树数据
		List<OrgtreeEntity> list = dao.findList(null);
		//封装数据到Map中, 以方便转JSON
		List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
		list.forEach( entity -> {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", entity.getId());
			map.put("name", entity.getName());
			map.put("pId", entity.getPid());
			map.put("lev", entity.getLevel());
			
			mapList.add(map);
		});
		return mapList;
	}
	
	/**
	 * 保存数据（插入）
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public Map<String, Object> add(OrgtreeEntity entity) {
		entity.setNewRecord(true);
		
		Map<String, Object> map = new HashMap<String, Object>();
		try
		{
			if(CommonUtil.isNotEmpty(entity.getId()))
			{
				dao.update(entity);
			}
			else
			{
				entity.setId( CommonUtil.uuid() );
				dao.insert(entity);
			}
			map.put("success", true);
			map.put("message", "恭喜("+entity.getName()+")操作成功!");
		}
		catch(Exception e)
		{
			map.put("success", false);
			map.put("message", "很遗憾, 出现错误, 请联系管理员!");
		}
		return map;
	}
	
	/**
	 * 删除数据（删除）
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public Map<String, Object> delete(String id) {
		orgtreeDao.delete(id);
		return null;
	}
	
}
