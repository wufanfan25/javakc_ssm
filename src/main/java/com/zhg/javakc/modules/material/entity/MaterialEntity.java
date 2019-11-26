package com.zhg.javakc.modules.material.entity;

import com.zhg.javakc.base.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Lob;
import java.util.Date;

public class MaterialEntity extends BaseEntity<MaterialEntity> {
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
    private byte[] materialPhoto;

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
    /**
     * 20更改时间
     */
   // private Date changeDate;

    /**
     * 21物资编码
     * @return
     */
    private String materialCode;

    /**
     * 22状态
     * @return
     */
    private int materialState;

    /**
     * 创建人
     * @return
     */
    private  String createrUser;

    public String getMaterialId() {
        return materialId;
    }

    public String getMaterialIdName() {
        return materialIdName;
    }

    public String getMaterialName() {
        return materialName;
    }

    public String getMaterialSpecs() {
        return materialSpecs;
    }

    public String getMaterialAbbr() {
        return materialAbbr;
    }

    public String getMaterialComment() {
        return materialComment;
    }

    public String getMaterialType() {
        return materialType;
    }

//    public byte[] getUserPhoto() {
//        return userPhoto;
//    }

    public int getMaterialCoding() {
        return materialCoding;
    }

    public int getLimitContract() {
        return limitContract;
    }

    public String getMaterialGroup() {
        return materialGroup;
    }

    public int getMaterialExp() {
        return materialExp;
    }

    public double getTaxRate() {
        return taxRate;
    }

    public String getMaterialUnit() {
        return materialUnit;
    }

    public String getMaterialProu() {
        return materialProu;
    }

    public int getMaterialSuttle() {
        return materialSuttle;
    }

    public int getMaterialGw() {
        return materialGw;
    }

    public String getMaterialVolume() {
        return materialVolume;
    }

    public String getVolumeUnit() {
        return volumeUnit;
    }

//    public Date getChangeDate() {
//        return changeDate;
//    }

    public void setMaterialId(String materialId) {
        this.materialId = materialId;
    }

    public void setMaterialIdName(String materialIdName) {
        this.materialIdName = materialIdName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    public void setMaterialSpecs(String materialSpecs) {
        this.materialSpecs = materialSpecs;
    }

    public void setMaterialAbbr(String materialAbbr) {
        this.materialAbbr = materialAbbr;
    }

    public void setMaterialComment(String materialComment) {
        this.materialComment = materialComment;
    }

    public void setMaterialType(String materialType) {
        this.materialType = materialType;
    }

//    public void setUserPhoto(byte[] userPhoto) {
//        this.userPhoto = userPhoto;
//    }

    public void setMaterialCoding(int materialCoding) {
        this.materialCoding = materialCoding;
    }

    public void setLimitContract(int limitContract) {
        this.limitContract = limitContract;
    }

    public void setMaterialGroup(String materialGroup) {
        this.materialGroup = materialGroup;
    }

    public void setMaterialExp(int materialExp) {
        this.materialExp = materialExp;
    }

    public void setTaxRate(double taxRate) {
        this.taxRate = taxRate;
    }

    public void setMaterialUnit(String materialUnit) {
        this.materialUnit = materialUnit;
    }

    public void setMaterialProu(String materialProu) {
        this.materialProu = materialProu;
    }

    public void setMaterialSuttle(int materialSuttle) {
        this.materialSuttle = materialSuttle;
    }

    public void setMaterialGw(int materialGw) {
        this.materialGw = materialGw;
    }

    public void setMaterialVolume(String materialVolume) {
        this.materialVolume = materialVolume;
    }

    public void setVolumeUnit(String volumeUnit) {
        this.volumeUnit = volumeUnit;
    }

//    public void setChangeDate(Date changeDate) {
//        this.changeDate = changeDate;
//    }

    public String getMaterialCode() {
        return materialCode;
    }

    public void setMaterialCode(String materialCode) {
        this.materialCode = materialCode;
    }

    public int getMaterialState() {
        return materialState;
    }

    public void setMaterialState(int materialState) {
        this.materialState = materialState;
    }

    public byte[] getMaterialPhoto() {
        return materialPhoto;
    }

    public void setMaterialPhoto(byte[] materialPhoto) {
        this.materialPhoto = materialPhoto;
    }

    public String getCreaterUser() {
        return createrUser;
    }

    public void setCreaterUser(String createrUser) {
        this.createrUser = createrUser;
    }
}
