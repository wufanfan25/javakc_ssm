package com.zhg.javakc.modules.org.tree.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhg.javakc.modules.org.tree.entity.OrgtreeEntity;
import com.zhg.javakc.modules.org.tree.service.OrgtreeService;

@Controller
@RequestMapping("/orgtree")
public class OrgtreeController {
	
	@Autowired
	private OrgtreeService orgtreeService;
	
	@RequestMapping("/query")
	@ResponseBody
	public List<Map<String, Object>> query() throws Exception
	{
		return orgtreeService.findList();
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Map<String, Object> add(OrgtreeEntity entity) throws Exception
	{
		return orgtreeService.add(entity);
	}
	
	@RequestMapping(value="/delete", params="id")
	@ResponseBody
	public Map<String, Object> delete(String id) throws Exception
	{
		return orgtreeService.delete(id);
	}
	
}