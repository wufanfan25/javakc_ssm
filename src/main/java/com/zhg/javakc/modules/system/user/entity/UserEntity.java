package com.zhg.javakc.modules.system.user.entity;

import java.io.Serializable;
import java.util.List;

import com.zhg.javakc.base.entity.BaseEntity;

/**
 * 基础用户信息模块实体类
 * @author zhou
 * @version 0.1
 */
public class UserEntity extends BaseEntity<UserEntity> implements Serializable{
	private String userId;
	private String userName;
	private String loginName;
	private String loginPass;
	private String userEmail;
	private String userPhone;
	private int userSex;
	private String roleName;
	private List<String> roleList;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getLoginPass() {
		return loginPass;
	}
	public void setLoginPass(String loginPass) {
		this.loginPass = loginPass;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public int getUserSex() {
		return userSex;
	}
	public void setUserSex(int userSex) {
		this.userSex = userSex;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public List<String> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<String> roleList) {
		this.roleList = roleList;
	}
	
}
