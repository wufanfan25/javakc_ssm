package com.zhg.javakc.modules.supplier.service;

import com.zhg.javakc.base.page.Page;
import com.zhg.javakc.base.service.BaseService;
import com.zhg.javakc.modules.supplier.dao.SupplierDao;
import com.zhg.javakc.modules.supplier.entity.SupplierEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.processing.SupportedOptions;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

  //在新增前获取数据库的序列值 通过逻辑设置转变为字符串编码
  public String findSupplierCode(){
    //编码格式 7000001  7 + 000001
    //      7(固定字符) + 000001(序列)
    //获取序列
    Integer supCode=dao.findSupplierCode();
    //变为字符串,并获取字符串长度
    String str1=supCode.toString();
    int length = str1.length();
    //保存0的个数
    String str2="";
    for (int i=0;i<6-length;i++){
        str2 += "0";
    }
    String supplierCode = '7' + str2 + str1;
    return supplierCode;
  }




}
