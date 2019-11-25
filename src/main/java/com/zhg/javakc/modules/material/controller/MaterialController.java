package com.zhg.javakc.modules.material.controller;

import com.zhg.javakc.base.page.Page;
import com.zhg.javakc.modules.material.entity.MaterialEntity;
import com.zhg.javakc.modules.material.service.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/material")
public class MaterialController {

    @Autowired
    MaterialService materialService;

    @RequestMapping("/queryList")
    public ModelAndView queryTest(MaterialEntity materialEntity, HttpServletRequest request, HttpServletResponse response){
        ModelAndView modelAndView = new ModelAndView("material/list");
        Page<MaterialEntity> page = materialService.queryTest(materialEntity, new Page<MaterialEntity>(request, response));
        modelAndView.addObject(page);
        return modelAndView;
    }

}
