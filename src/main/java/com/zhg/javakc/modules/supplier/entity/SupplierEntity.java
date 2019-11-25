package com.zhg.javakc.modules.supplier.entity;

import com.zhg.javakc.base.entity.BaseEntity;

import javax.persistence.Entity;
import javax.persistence.Table;


public class SupplierEntity extends BaseEntity<SupplierEntity> {
  private String supplierType;
  private String supplierId;
  private String supplierName;
  private String supplierCode;
  private String supplierClass;
  private Integer supplierAbbr;
  private String legalPerson;
  private String legalperPhone;
  private String supplierAddress;
  private String socialCode;
  private String supplierLinkman;
  private String linkmanPhone;
  private String linkmanEmail;
  private Integer EnablePortal;
  private Integer NecessaryContract;
  private String orgId;

  public String getSupplierType() {
    return supplierType;
  }

  public void setSupplierType(String supplierType) {
    this.supplierType = supplierType;
  }

  public String getSupplierId() {
    return supplierId;
  }

  public void setSupplierId(String supplierId) {
    this.supplierId = supplierId;
  }

  public String getSupplierName() {
    return supplierName;
  }

  public void setSupplierName(String supplierName) {
    this.supplierName = supplierName;
  }

  public String getSupplierCode() {
    return supplierCode;
  }

  public void setSupplierCode(String supplierCode) {
    this.supplierCode = supplierCode;
  }

  public String getSupplierClass() {
    return supplierClass;
  }

  public void setSupplierClass(String supplierClass) {
    this.supplierClass = supplierClass;
  }

  public Integer getSupplierAbbr() {
    return supplierAbbr;
  }

  public void setSupplierAbbr(Integer supplierAbbr) {
    this.supplierAbbr = supplierAbbr;
  }

  public String getLegalPerson() {
    return legalPerson;
  }

  public void setLegalPerson(String legalPerson) {
    this.legalPerson = legalPerson;
  }

  public String getLegalperPhone() {
    return legalperPhone;
  }

  public void setLegalperPhone(String legalperPhone) {
    this.legalperPhone = legalperPhone;
  }

  public String getSupplierAddress() {
    return supplierAddress;
  }

  public void setSupplierAddress(String supplierAddress) {
    this.supplierAddress = supplierAddress;
  }

  public String getSocialCode() {
    return socialCode;
  }

  public void setSocialCode(String socialCode) {
    this.socialCode = socialCode;
  }

  public String getSupplierLinkman() {
    return supplierLinkman;
  }

  public void setSupplierLinkman(String supplierLinkman) {
    this.supplierLinkman = supplierLinkman;
  }

  public String getLinkmanPhone() {
    return linkmanPhone;
  }

  public void setLinkmanPhone(String linkmanPhone) {
    this.linkmanPhone = linkmanPhone;
  }

  public String getLinkmanEmail() {
    return linkmanEmail;
  }

  public void setLinkmanEmail(String linkmanEmail) {
    this.linkmanEmail = linkmanEmail;
  }

  public Integer getEnablePortal() {
    return EnablePortal;
  }

  public void setEnablePortal(Integer enablePortal) {
    EnablePortal = enablePortal;
  }

  public Integer getNecessaryContract() {
    return NecessaryContract;
  }

  public void setNecessaryContract(Integer necessaryContract) {
    NecessaryContract = necessaryContract;
  }

  public String getOrgId() {
    return orgId;
  }

  public void setOrgId(String orgId) {
    this.orgId = orgId;
  }
}
