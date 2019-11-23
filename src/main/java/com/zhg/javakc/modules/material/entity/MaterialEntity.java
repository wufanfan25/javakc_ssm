package com.zhg.javakc.modules.material.entity;

import javax.persistence.Column;
import javax.persistence.Lob;

public class MaterialEntity {
    /*
    1物资ID
     */
    private String materialId;

    /**
     * 2物资类型的全路径  如: 原料类/肉类/牛肉类
     */
    private String materialIdName;

    /*
    3物资名称
     */
    private String materialName;

    /*
    4物资规格
     */
    private String materialSpecs;

    /*
    5物资简称
     */
    private String materialAbbr;

    /*
    6物资描述
     */
    private String materialComment;

    /*
    7物资类型
     */
    private String materialType;

    /**
     * 8物资图片 oracle数据库blob字段存储
     */
    @Lob
    @Column(name = "data_material")
    private byte[] userPhoto;

    /**
     *9 是否赋码 0 否 1 是
     */
    private int materialCoding;

    /*
    10 限制合同 0 否 1 是
     */
    private int limitContract;

    /*
    11 物资组
     */
    private String materialGroup;

    /*
    12 保质期
     */
    private int materialExp;
    /*
    13 税率 xx%
     */
    private double taxRate;

    /*
    14 基本单位
     */
    private String materialUnit;
    /**
     * 15 生产单位
     */
    private String materialProu;
    /**
     * 16 物资净重
     */
    private int materialSuttle;

    /**
     * 17 物资毛重
     */
    private int materialGw;

    /**
     *18 物资体积
     */
    private String materialVolume;

    /**
     * 19 物资体积单位
     */
    private String volumeUnit;
}
