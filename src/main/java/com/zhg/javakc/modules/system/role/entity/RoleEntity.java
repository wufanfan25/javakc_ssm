package com.zhg.javakc.modules.system.role.entity;

import java.util.List;

import com.zhg.javakc.base.entity.BaseEntity;

/**
 * 基础信息角色对象
 * @author zhg
 * @version 0.1
 */
public class RoleEntity extends BaseEntity<RoleEntity>{
	private String roleId;
	private String roleName;
	private String roleRemark;
	private List<String> menuList;
	
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleRemark() {
		return roleRemark;
	}
	public void setRoleRemark(String roleRemark) {
		this.roleRemark = roleRemark;
	}
	public List<String> getMenuList() {
		return menuList;
	}
	public void setMenuList(List<String> menuList) {
		this.menuList = menuList;
	}
}
