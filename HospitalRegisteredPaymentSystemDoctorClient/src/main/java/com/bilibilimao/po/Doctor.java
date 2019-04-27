package com.bilibilimao.po;

import java.io.Serializable;
import java.sql.Date;

public class Doctor implements Serializable {
	private static final long serialVersionUID = 5826580363286013253L;
	private int id;
	private String name;
	private String sex;
	private Date birth;
	private String education;
	private String number;
	private String account;
	private String password;
	private String experience;
	private int level;
	private Date workDate;
	private String position;
	private String photo;
	private String department;
	private String weak;
	public Doctor() {
		super();
	}
	public Doctor(int id, String name, String sex, Date birth, String education, String number, String account,
			String password, String experience, int level, Date workDate, String position, String photo,
			String department, String weak) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.birth = birth;
		this.education = education;
		this.number = number;
		this.account = account;
		this.password = password;
		this.experience = experience;
		this.level = level;
		this.workDate = workDate;
		this.position = position;
		this.photo = photo;
		this.department = department;
		this.weak = weak;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
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
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public Date getWorkDate() {
		return workDate;
	}
	public void setWorkDate(Date workDate) {
		this.workDate = workDate;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getWeak() {
		return weak;
	}
	public void setWeak(String weak) {
		this.weak = weak;
	}
	@Override
	public String toString() {
		return "Doctor [id=" + id + ", name=" + name + ", sex=" + sex + ", birth=" + birth + ", education=" + education
				+ ", number=" + number + ", account=" + account + ", password=" + password + ", experience="
				+ experience + ", level=" + level + ", workDate=" + workDate + ", position=" + position + ", photo="
				+ photo + ", department=" + department + ", weak=" + weak + "]";
	}
}