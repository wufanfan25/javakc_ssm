package com.zhg.javakc.modules.material.service;


import com.zhg.javakc.base.service.BaseService;
import com.zhg.javakc.base.util.CommonUtil;
import com.zhg.javakc.modules.material.dao.MaterialTypeDao;
import com.zhg.javakc.modules.material.entity.MaterialType;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MaterialTypeService extends BaseService<MaterialTypeDao, MaterialType> {

    public List<Map<String,Object>> query(){
        // 查询的数据以map保存在list里
        List<Map<String,Object>> mapList = new ArrayList<>();

        List<MaterialType> list = dao.findAllList();
        for(MaterialType materialType: list){
           Map<String,Object> map=new  HashMap<String,Object>();
            map.put("id", materialType.getMtypeId());
            map.put("name", materialType.getMtypeName());
            map.put("abbr", materialType.getMtypeAbbr());
            map.put("code", materialType.getMtypeCode());
            map.put("pId", materialType.getMtypePid());
            map.put("lev", materialType.getMtypeLevel());
          //  map.put("weight",materialType.getMtypeWeight());
            map.put("open","true");
            mapList.add(map);
        }
        return mapList;
    }

    /**
     * 更新和删除公用
     * @param materialType
     * @return
     */
    public Map<String,Object> updateType(MaterialType materialType){

        Map<String,Object> map = new HashMap<>();
        try{
            //执行更新
           if(CommonUtil.isNotEmpty(materialType.getMtypeId())){
            dao.update(materialType);
            map.put("message", "更新成功!");
           }else{
               //执行添加
               materialType.setMtypeId(CommonUtil.uuid());
               //层级+1
               materialType.setMtypeLevel(materialType.getMtypeLevel()+1);
               dao.insert(materialType);
               map.put("message", "添加成功!");
           }
        }catch(Exception e){
            map.put("message", "很遗憾, 出现错误, 请联系管理员!");}
        return map;
    }

    public void deleteType (String mtypeId){
        dao.deleteType(mtypeId);
    }

    //在新增前获取数据库的序列值 通过逻辑设置转变为字符串编码
    public Map<String,Object> findTypeCode (Integer mtypeLevel){

        //编码格式 k010001  k + 01 + 0001
        //      k(固定字符) + 01(层级) + 0001(序列)

        //获取序列
        Integer mtypeCode = dao.findTypeCode();
        //变为字符串,并获取字符串长度
        String str1 = mtypeCode.toString();
        int length = str1.length();
        //保存0的个数
        String str2="";
        for(int i=0; i< 5 - length ; i++ ){
            str2 += "0";
        }
        //层级
        Integer i = mtypeLevel + 1;

        //拼接
        String typeCode = 'k'+ i.toString() + str2 + str1 ;
        System.out.println(typeCode+"<<<<=====typeCode------");

        //封装数据到map返回
        Map<String,Object> map = new HashMap<>();
        map.put("mtypeCode" , typeCode);
        return map;
    }

}
