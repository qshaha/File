package com.bilibilimao.po;

import java.io.Serializable;

public class Administrators implements Serializable {
	private static final long serialVersionUID = 2721585381695724132L;
	private int id;
	private String account;
	private String password;
	private int level;
	public Administrators() {
		super();
	}
	public Administrators(int id, String account, String password, int level) {
		super();
		this.id = id;
		this.account = account;
		this.password = password;
		this.level = level;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	@Override
	public String toString() {
		return "Administrators [id=" + id + ", account=" + account + ", password=" + password + ", level=" + level
				+ "]";
	}
}