package com.zhg.javakc.modules.pricegroup.entity;

import com.zhg.javakc.base.entity.BaseEntity;

public class PriceEntity extends BaseEntity<PriceEntity> {

   private String priceGroupId;
   private int groupCode;
   private String groupName;
   private String groupCreater;

    public int getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(int groupCode) {
        this.groupCode = groupCode;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getGroupCreater() {
        return groupCreater;
    }

    public void setGroupCreater(String groupCreater) {
        this.groupCreater = groupCreater;
    }

    public String getPriceGroupId() {
        return priceGroupId;
    }

    public void setPriceGroupId(String priceGroupId) {
        this.priceGroupId = priceGroupId;
    }
}
