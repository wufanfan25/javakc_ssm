package com.zhg.javakc.modules.pricegroup.controller;

import com.zhg.javakc.base.page.Page;
import com.zhg.javakc.modules.pricegroup.entity.PriceEntity;
import com.zhg.javakc.modules.pricegroup.service.PriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/price")
public class PriceController {

    @Autowired
    private PriceService priceService;

    @RequestMapping("/query")
    public ModelAndView query(PriceEntity priceEntity,
                              HttpServletRequest request,
                              HttpServletResponse response){
        ModelAndView modelAndView = new ModelAndView("pricegroup/list");
        Page<PriceEntity> page = priceService.query(priceEntity, new Page<PriceEntity>(request, response));
        modelAndView.addObject(page);
        return modelAndView;
    }
}
