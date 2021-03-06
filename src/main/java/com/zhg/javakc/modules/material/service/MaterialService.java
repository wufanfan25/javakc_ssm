package com.zhg.javakc.modules.material.service;

import com.zhg.javakc.base.page.Page;
import com.zhg.javakc.base.service.BaseService;
import com.zhg.javakc.modules.material.dao.MaterialDao;
import com.zhg.javakc.modules.material.entity.MaterialEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MaterialService extends BaseService<MaterialDao, MaterialEntity> {

    @Autowired
    MaterialDao materialDao;

    public Page<MaterialEntity> queryTest(MaterialEntity materialEntity,Page<MaterialEntity> page){
        //设置分页参数，才会被MyBatis分页插件所识别，拦截sql，并加入分页sql语句
        materialEntity.setPage(page);
        //根据分页与查询条件 查询
        List<MaterialEntity> materialList = materialDao.findList(materialEntity);
        return page.setList(materialList);
    }

    //序列字符串化
    public String findMaterialCode(){
        Integer materialCodes= dao.findMaterialCode();
        String s1=materialCodes.toString();
        int len=s1.length();
        for(int i=len;i<8;i++){
             s1="0"+s1;
        }
        return s1;
    }





}
