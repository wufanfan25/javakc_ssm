package com.zhg.javakc.modules.material.controller;

import com.zhg.javakc.base.page.Page;
import com.zhg.javakc.base.util.CommonUtil;
import com.zhg.javakc.modules.material.entity.MaterialEntity;
import com.zhg.javakc.modules.material.service.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.sql.Timestamp;
import java.util.Map;

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

    @RequestMapping("/save")
    public String save(MaterialEntity materialEntity){
        materialEntity.setMaterialId(CommonUtil.uuid());
        materialEntity.setUpdateDate(new Timestamp(System.currentTimeMillis()));
//        try {
//            String path = ResourceUtils.getURL("classpath:").getPath();
//            File photoFile = new File(path + File.separator + name);
//            photo.transferTo(photoFile);
//        }catch(Exception e){
//            e.printStackTrace();
//        }
        materialService.save(materialEntity);
        return "redirect:queryList.do";
    }

    @RequestMapping("/view")
    public String view(String ids, ModelMap modelMap){
        MaterialEntity materialEntity=materialService.get(ids);
        modelMap.put("materialEntity",materialEntity);
        return "material/update";
    }

    @RequestMapping("/update")
    public String update(MaterialEntity materialEntity){
        materialEntity.setUpdateDate(new Timestamp(System.currentTimeMillis()));
        materialService.update(materialEntity);
        return "redirect:queryList.do";
    }

    @RequestMapping("/findcode")
    @ResponseBody
    public Map<String,Object> findmatrialcode(){
        return  materialService.findmatrialcode();
    }

}
