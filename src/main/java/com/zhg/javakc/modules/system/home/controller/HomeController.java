package com.zhg.javakc.modules.system.home.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhg.javakc.modules.system.home.service.HomeService;

@Controller
@RequestMapping("/home")
public class HomeController {

	@Autowired
	private HomeService homeService;
	
	@RequestMapping("/query")
	@ResponseBody
	public Map<String, Object> query()
	{
		return homeService.query("userId");
	}
	
	@RequestMapping("/chart")
	@ResponseBody
	public Map<String, Object> chart()
	{
		return homeService.chart("userId");
	}
	
}
