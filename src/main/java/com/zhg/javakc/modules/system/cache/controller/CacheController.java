package com.zhg.javakc.modules.system.cache.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhg.javakc.modules.dictionary.entity.DictionaryEntity;
import com.zhg.javakc.modules.dictionary.service.DictionaryService;
import com.zhg.javakc.modules.system.cache.service.CacheService;
import com.zhg.javakc.modules.system.menu.service.MenuService;

/**
 * 基础缓存信息表现层实现
 * @author zhg
 * @version v0.1
 */
@Controller
@RequestMapping(value = "/cache")
public class CacheController {
	
	@Autowired
	private DictionaryService dictionaryService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private CacheService cacheService;
	
	private Map<String, Object> result = new HashMap<String, Object>();
	
	public CacheController()
	{
		result.put("message", "刷新成功！");
	}
	
	/**
	 * 数组字典刷新
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/dictionary")
	@ResponseBody
	public Map<String, Object> dictionary(HttpServletRequest request)
	{
		List<DictionaryEntity> dictionaryList = dictionaryService.findList(new DictionaryEntity());
		request.getServletContext().setAttribute("tagData", cacheService.getCodeMap(dictionaryList));
		return result;
	}
	
	/**
	 * 菜单字典刷新
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/menu")
	@ResponseBody
	public Map<String, Object> menu(HttpServletRequest request)
	{
		List<Map<String, Object>> menuList = menuService.findList();
		request.getServletContext().setAttribute("menuData", cacheService.homeMenu(menuList));
		return result;
	}
	
}
