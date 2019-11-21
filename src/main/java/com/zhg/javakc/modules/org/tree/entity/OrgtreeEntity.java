package com.zhg.javakc.modules.org.tree.entity;

import com.zhg.javakc.base.entity.BaseEntity;

public class OrgtreeEntity extends BaseEntity<OrgtreeEntity>{
	private String id;
	private String name;
	private String pid;
	private int level;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
}
