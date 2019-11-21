package com.zhg.javakc.modules.system.home.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhg.javakc.base.service.BaseService;
import com.zhg.javakc.modules.system.home.dao.HomeDao;
import com.zhg.javakc.modules.system.home.entity.HomeEntity;

@Service
public class HomeService extends BaseService<HomeDao, HomeEntity>{
	
	@Autowired
	private HomeDao homeDao;
	
	/**
	 * 查询首页 添加纪录
	 * 新增客户
	 * 新增联系人
	 * 新增商机
	 * xxxx
	 * @return
	 */
	public Map<String, Object> query(String userId)
	{
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("count1", 10);
		param.put("count2", 30);
		param.put("count3", 20);
		
		return param;
	}
	
	public Map<String, Object> chart(String userId)
	{
		Map<String, Object> param = new HashMap<String, Object>();
		
		List<Long> total = new ArrayList<Long>();
		List<String> ctime = new ArrayList<String>();
		
		List<Map<String, Object>> list = homeDao.chart();
		
		list.forEach( map -> {
			ctime.add(map.get("CTIME").toString());
			total.add(Long.valueOf(map.get("TOTAL").toString()));
		});
		
		param.put("ctime", ctime);
		param.put("total", total);
		
		return param;
	}
	
}
