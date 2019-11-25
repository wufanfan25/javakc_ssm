package com.zhg.javakc.modules.material.entity;

import com.zhg.javakc.base.entity.BaseEntity;

public class MaterialType extends BaseEntity<MaterialType> {

    private String mtypeId;
    private String mtypeName;
    private String mtypeAbbr;
    private String mtypeCode;
    private int mtypeLevel;
    private int mtypeWeight;
    private String mtypePid;

    public String getMtypeId() {
        return mtypeId;
    }

    public void setMtypeId(String mtypeId) {
        this.mtypeId = mtypeId;
    }

    public String getMtypeName() {
        return mtypeName;
    }

    public void setMtypeName(String mtypeName) {
        this.mtypeName = mtypeName;
    }

    public String getMtypeAbbr() {
        return mtypeAbbr;
    }

    public void setMtypeAbbr(String mtypeAbbr) {
        this.mtypeAbbr = mtypeAbbr;
    }

    public String getMtypeCode() {
        return mtypeCode;
    }

    public void setMtypeCode(String mtypeCode) {
        this.mtypeCode = mtypeCode;
    }

    public int getMtypeLevel() {
        return mtypeLevel;
    }

    public void setMtypeLevel(int mtypeLevel) {
        this.mtypeLevel = mtypeLevel;
    }

    public int getMtypeWeight() {
        return mtypeWeight;
    }

    public void setMtypeWeight(int mtypeWeight) {
        this.mtypeWeight = mtypeWeight;
    }

    public String getMtypePid() {
        return mtypePid;
    }

    public void setMtypePid(String mtypePid) {
        this.mtypePid = mtypePid;
    }
}
