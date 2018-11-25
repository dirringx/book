package com.book.pojos;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Manager implements Serializable {

	private String id;

	/** 名字 **/
	private String name;

	/** 工号 **/
	private String workNumber;

	/** 密码 **/
	private String password;

	/** 权限 **/
	private int permission;

	public Manager() {}

	public Manager(String name, String workNumber, String password, int permission) {
		this.name = name;
		this.workNumber = workNumber;
		this.password = password;
		this.permission = permission;
	}

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

	public String getWorkNumber() {
		return workNumber;
	}

	public void setWorkNumber(String workNumber) {
		this.workNumber = workNumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getPermission() {
		return permission;
	}

	public void setPermission(int permission) {
		this.permission = permission;
	}

}
