package com.zhg.javakc.modules.system.role.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhg.javakc.base.page.Page;
import com.zhg.javakc.modules.system.menu.entity.MenuEntity;
import com.zhg.javakc.modules.system.menu.service.MenuService;
import com.zhg.javakc.modules.system.role.entity.RoleEntity;
import com.zhg.javakc.modules.system.role.service.RoleService;

/**
 * 基础信息角色表现层实现
 * @author zhg
 * @version v0.1
 */
@Controller
@RequestMapping(value = "/role")
public class RoleController {

	@Autowired
	private RoleService roleService;
	@Autowired
	private MenuService menuService;
	
	/**
	 * 根据条件分页查询
	 * @param entity 查询条件
	 * @param model	 页面传参对象
	 * @param request 请求
	 * @param response 响应
	 * @return			展示数据列表页面
	 * @throws Exception 抛出异常
	 */
	@RequiresPermissions("role:query")
	@RequestMapping(value="/query")
	public String query(RoleEntity entity, ModelMap model, 
			HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		model.put("page", roleService.findRole(new Page<RoleEntity>(request, response), entity));
		model.put("entity", entity);
		return "system/role/list";
	}
	
	/**
	 * 添加方法
	 * @param entity 实体对象
	 * @return
	 */
	@RequestMapping(value="/add")
	public String add(MenuEntity entity, ModelMap model)
	{
		model.put("page", menuService.findList(entity));
		return "system/role/create";
	}
	
	/**
	 * 添加方法
	 * @param entity 实体对象
	 * @return
	 */
	@RequiresPermissions("role:create")
	@RequestMapping(value="/create")
	public String create(RoleEntity entity, String[] ids)
	{
		roleService.save(entity, ids);
		return "redirect:/role/query.do";
	}
	
	/**
	 * 跳转到修改展示页面
	 * @param ids 当前对象主键ID
	 * @param model 页面传递参数对象
	 * @return
	 */
	@RequestMapping(value="/view")
	public String view(MenuEntity entity, String ids, ModelMap model)
	{
		model.put("entity", roleService.get(ids));
		model.put("page", menuService.findList(entity));
		return "system/role/update";
	}
	
	/**
	 * 修改方法
	 * @param entity 修改的实体类
	 * @return
	 */
	@RequiresPermissions("role:update")
	@RequestMapping(value="/update")
	public String update(RoleEntity entity, String[] ids)
	{
		roleService.update(entity, ids);
		return "redirect:/role/query.do";
	}
	
	/**
	 * 批量删除对象
	 * @param ids 批量主键ID数组
	 * @return
	 */
	@RequiresPermissions("role:delete")
	@RequestMapping(value="/delete")
	public String delete(String[] ids)
	{
		roleService.delete(ids);
		return "redirect:/role/query.do";
	}

}
