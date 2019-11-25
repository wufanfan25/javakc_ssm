package com.zhg.javakc.modules.material.dao;

import com.zhg.javakc.base.dao.BaseDao;
import com.zhg.javakc.modules.material.entity.MaterialType;

public interface MaterialTypeDao extends BaseDao<MaterialType> {

    public void deleteType(String mtypeId);

    public Integer findTypeCode();

}
