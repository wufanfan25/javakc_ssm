package com.zhg.javakc.base.util.listener;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.zhg.javakc.modules.dictionary.entity.DictionaryEntity;
import com.zhg.javakc.modules.dictionary.service.DictionaryService;
import com.zhg.javakc.modules.system.cache.service.CacheService;
import com.zhg.javakc.modules.system.menu.service.MenuService;

/**
 * 数据字典监听器
 * @author zhou
 * @version v0.1
 */
public class DictionaryListener implements ServletContextListener{
	
	private DictionaryService dictionaryService;
	private MenuService menuService;
	private CacheService cacheService;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	/**
	 * 初始化数据到缓存中
	 */
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(sce.getServletContext());
		cacheService = wac.getBean("cacheService", CacheService.class);
		
		/**
		 * 初始化数据字典数据
		 */
		dictionaryService = wac.getBean("dictionaryService", DictionaryService.class);
		List<DictionaryEntity> dictionaryList = dictionaryService.findList(new DictionaryEntity());
		sce.getServletContext().setAttribute("tagData", cacheService.getCodeMap(dictionaryList));
		log.info("数据字典初始化完成!");
		
		/**
		 * 初始化主页菜单数据
		 */
		menuService = wac.getBean("menuService", MenuService.class);
		List<Map<String, Object>> menuList = menuService.findList();
		sce.getServletContext().setAttribute("menuData", cacheService.homeMenu(menuList));
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		log.info("数据字典销毁成功!");
	}
	
}
