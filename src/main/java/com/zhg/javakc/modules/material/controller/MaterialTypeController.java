package com.zhg.javakc.modules.material.controller;


import com.zhg.javakc.modules.material.entity.MaterialType;
import com.zhg.javakc.modules.material.service.MaterialTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/materialtype")
public class MaterialTypeController {

    @Autowired
    private MaterialTypeService materialTypeService;

    @RequestMapping("/query")
    @ResponseBody
    public List<Map<String,Object>> query(){
        return materialTypeService.query();
    }

    //更新和添加
    @RequestMapping("/update")
    @ResponseBody
    public Map<String,Object> update(MaterialType materialType){
        return materialTypeService.updateType(materialType);
    }


    //删除--存储过程递归删除
    @RequestMapping("/delete")
    public String delete(MaterialType materialType){
        System.out.println("------------########-------------"+materialType.getMtypeId());
        materialTypeService.deleteType(materialType.getMtypeId());
        return "redirect:/view/material/type/list.jsp";
    }

    //获取物资类别字符串编码
    @RequestMapping("/findTypeCode")
    @ResponseBody
    public Map<String,Object> findTypeCode(Integer mtypeLevel){
       return materialTypeService.findTypeCode(mtypeLevel);
    }


}
