package com.zhg.javakc.modules.dictionary.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhg.javakc.base.page.Page;
import com.zhg.javakc.modules.dictionary.entity.DictionaryEntity;
import com.zhg.javakc.modules.dictionary.service.DictionaryService;

/**
 * 数据字典表现层实现
 * @author zhg
 * @version v0.1
 */
@Controller
@RequestMapping(value = "/dictionary")
public class DictionaryController {

	@Autowired
	private DictionaryService dictionaryService;
	
	/**
	 * 根据条件分页查询
	 * @param entity 查询条件
	 * @param model	 页面传参对象
	 * @param request 请求
	 * @param response 响应
	 * @return			展示数据列表页面
	 * @throws Exception 抛出异常
	 */
	@RequiresPermissions("dictionary:query")
	@RequestMapping(value="/query")
	public String query(DictionaryEntity entity, ModelMap model, 
			HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		model.put("page", dictionaryService.findDictionary(new Page<DictionaryEntity>(request, response), entity));
		model.put("entity", entity);
		return "dictionary/list";
	}
	
	/**
	 * 添加方法
	 * @param entity 实体对象
	 * @return
	 */
	@RequiresPermissions("dictionary:create")
	@RequestMapping(value="/create")
	public String create(DictionaryEntity entity, String[] code, String[] val)
	{
		dictionaryService.save(entity, code, val);
		return "redirect:/dictionary/query.do";
	}
	
	/**
	 * 跳转到修改展示页面
	 * @param ids 当前对象主键ID
	 * @param model 页面传递参数对象
	 * @return
	 */
	@RequiresPermissions("dictionary:view")
	@RequestMapping(value="/view")
	public String view(String ids, ModelMap model)
	{
		model.put("entity", dictionaryService.get(ids));
		return "dictionary/update";
	}
	
	/**
	 * 修改方法
	 * @param entity 修改的实体类
	 * @return
	 */
	@RequiresPermissions("dictionary:update")
	@RequestMapping(value="/update")
	public String update(DictionaryEntity entity)
	{
		dictionaryService.update(entity);
		return "redirect:/dictionary/query.do";
	}
	
	/**
	 * 批量删除对象
	 * @param ids 批量主键ID数组
	 * @return
	 */
	@RequiresPermissions("dictionary:delete")
	@RequestMapping(value="/delete")
	public String delete(String[] ids)
	{
		dictionaryService.delete(ids);
		return "redirect:/dictionary/query.do";
	}

}
