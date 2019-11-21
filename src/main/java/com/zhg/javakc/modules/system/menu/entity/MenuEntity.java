package com.zhg.javakc.modules.system.menu.entity;

import com.zhg.javakc.base.entity.BaseEntity;

/**
 * 基础菜单信息模块实体对象
 * @author zhou
 * @version 0.1
 */
public class MenuEntity extends BaseEntity<MenuEntity>{
	private String menuId;
	private String menuName;
	private String menuPid;
	private String menuLevel;
	private String menuUri;
	private String menuPermission;
	private int menuWeight;
	private int menuState;
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuPid() {
		return menuPid;
	}
	public void setMenuPid(String menuPid) {
		this.menuPid = menuPid;
	}
	public String getMenuLevel() {
		return menuLevel;
	}
	public void setMenuLevel(String menuLevel) {
		this.menuLevel = menuLevel;
	}
	public String getMenuUri() {
		return menuUri;
	}
	public void setMenuUri(String menuUri) {
		this.menuUri = menuUri;
	}
	public String getMenuPermission() {
		return menuPermission;
	}
	public void setMenuPermission(String menuPermission) {
		this.menuPermission = menuPermission;
	}
	public int getMenuWeight() {
		return menuWeight;
	}
	public void setMenuWeight(int menuWeight) {
		this.menuWeight = menuWeight;
	}
	public int getMenuState() {
		return menuState;
	}
	public void setMenuState(int menuState) {
		this.menuState = menuState;
	}
}
