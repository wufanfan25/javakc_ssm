package com.zhg.javakc.modules.supplier.controller;


import com.zhg.javakc.base.page.Page;
import com.zhg.javakc.base.util.CommonUtil;
import com.zhg.javakc.modules.supplier.entity.SupplierEntity;
import com.zhg.javakc.modules.supplier.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.Entity;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/supplier")
public class SupplierController {
    @Autowired
    SupplierService supplierService;

    @RequestMapping("/querySupplier")
    public ModelAndView querySupplier(SupplierEntity supplierEntity, HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView("supplier/list");
        Page<SupplierEntity> page = supplierService.querySupplier(supplierEntity, new Page<SupplierEntity>(request, response));
        modelAndView.addObject(page);
        return modelAndView;
    }

    @RequestMapping("/save")
    public String save(SupplierEntity supplierentity) {

        supplierentity.setSupplierCode(supplierService.findSupplierCode());
        supplierentity.setSupplierId(CommonUtil.uuid());
        if(supplierentity.getNecessaryContract()==null){
            supplierentity.setNecessaryContract(0);
        }
        if (supplierentity.getEnablePortal()==null){
            supplierentity.setEnablePortal(0);
        }
        supplierService.save(supplierentity);
        return "redirect:querySupplier.do";
    }

    @RequestMapping("/view")
    public String view(String ids, ModelMap modelMap) {
        SupplierEntity supplierEntity = supplierService.get(ids);
        modelMap.put("supplierEntity", supplierEntity);
        return "supplier/update";
    }

    @RequestMapping("/update")
    public String update(SupplierEntity supplierentity) {
        supplierService.update(supplierentity);
        return "redirect:querySupplier.do";
    }

    @RequestMapping("/delete")
    public String delete(String[] ids){
        supplierService.delete(ids);
        return "redirect:querySupplier.do";
    }

    @RequestMapping("/details")
    public String detail(String ids, ModelMap modelMap) {
        SupplierEntity supplierEntity = supplierService.get(ids);
        modelMap.put("supplierEntity", supplierEntity);
        return "redirect:supplier/detail.jsp";
    }


}
