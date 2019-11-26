package com.zhg.javakc.modules.pricegroup.service;

import com.zhg.javakc.base.page.Page;
import com.zhg.javakc.base.service.BaseService;
import com.zhg.javakc.modules.pricegroup.dao.PriceDao;
import com.zhg.javakc.modules.pricegroup.entity.PriceEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PriceService extends BaseService<PriceDao, PriceEntity> {


    public Page<PriceEntity> query(PriceEntity priceEntity, Page<PriceEntity> page){
        //设置分页参数，才会被MyBatis分页插件所识别，拦截sql，并加入分页sql语句
        priceEntity.setPage(page);
        //根据分页与查询条件 查询
        List<PriceEntity> list = dao.findList(priceEntity);
        System.out.println(list.toString()+"============");
        return page.setList(list);
    }

}
