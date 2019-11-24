package com.zhg.javakc.modules.supplier.service;

import com.zhg.javakc.base.page.Page;
import com.zhg.javakc.base.service.BaseService;
import com.zhg.javakc.modules.supplier.dao.SupplierDao;
import com.zhg.javakc.modules.supplier.entity.SupplierEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.processing.SupportedOptions;
import java.util.List;

@Service
public class SupplierService extends BaseService<SupplierDao, SupplierEntity>{
  @Autowired
  SupplierDao supplierDao;
  public Page<SupplierEntity> querySupplier(SupplierEntity supplierEntity,Page<SupplierEntity> page){
    //设置分页参数，才会被MyBatis分页插件所识别，拦截sql，并加入分页sql语句pplierEntity.setPage(page);
    supplierEntity.setPage(page);
    //根据分页与查询条件 查询
    List<SupplierEntity> listSupplier   =supplierDao.findList(supplierEntity);
    return page.setList(listSupplier);
  }




}
