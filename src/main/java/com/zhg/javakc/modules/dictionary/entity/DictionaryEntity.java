package com.zhg.javakc.modules.dictionary.entity;

import com.zhg.javakc.base.entity.BaseEntity;

/**
 * 数据字典模块实体类
 * @author zhou
 * @version 0.1
 */
public class DictionaryEntity extends BaseEntity<DictionaryEntity>{
	private String dataId;
	private String dataName;
	private String dataType;
	private String dataCode;
	private String dataVal;
	private String dataCommon;
	public String getDataId() {
		return dataId;
	}
	public void setDataId(String dataId) {
		this.dataId = dataId;
	}
	public String getDataName() {
		return dataName;
	}
	public void setDataName(String dataName) {
		this.dataName = dataName;
	}
	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	public String getDataCode() {
		return dataCode;
	}
	public void setDataCode(String dataCode) {
		this.dataCode = dataCode;
	}
	public String getDataVal() {
		return dataVal;
	}
	public void setDataVal(String dataVal) {
		this.dataVal = dataVal;
	}
	public String getDataCommon() {
		return dataCommon;
	}
	public void setDataCommon(String dataCommon) {
		this.dataCommon = dataCommon;
	}
}
