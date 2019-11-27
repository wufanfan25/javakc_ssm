package com.zhg.javakc.modules.supplier.dao;

import com.zhg.javakc.base.dao.BaseDao;
import com.zhg.javakc.modules.supplier.entity.SupplierEntity;

public interface SupplierDao extends BaseDao<SupplierEntity> {
    public Integer findSupplierCode();
}
