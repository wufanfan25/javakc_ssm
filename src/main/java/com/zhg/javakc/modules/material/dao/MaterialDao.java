package com.zhg.javakc.modules.material.dao;

import com.zhg.javakc.base.dao.BaseDao;
import com.zhg.javakc.base.dao.MyBatisDao;
import com.zhg.javakc.modules.material.entity.MaterialEntity;

@MyBatisDao
public interface MaterialDao extends BaseDao<MaterialEntity> {

    public Integer findMaterialCode();


}
