package com.bilibilimao.po;

import java.io.Serializable;
import java.sql.Date;

public class Patient implements Serializable {
	private static final long serialVersionUID = -7066186655121336909L;
	private int id;
	private String name;
	private String sex;
	private Date birth;
	private String idCard;
	private String safetyProblem;
	private String address;
	private String number;
	private Date registrationTime;
	private String password;
	public Patient() {
		super();
	}
	public Patient(int id, String name, String sex, Date birth, String idCard, String safetyProblem, String address,
			String number, Date registrationTime, String password) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.birth = birth;
		this.idCard = idCard;
		this.safetyProblem = safetyProblem;
		this.address = address;
		this.number = number;
		this.registrationTime = registrationTime;
		this.password = password;
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
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getSafetyProblem() {
		return safetyProblem;
	}
	public void setSafetyProblem(String safetyProblem) {
		this.safetyProblem = safetyProblem;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public Date getRegistrationTime() {
		return registrationTime;
	}
	public void setRegistrationTime(Date registrationTime) {
		this.registrationTime = registrationTime;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Patient [id=" + id + ", name=" + name + ", sex=" + sex + ", birth=" + birth + ", idCard=" + idCard
				+ ", safetyProblem=" + safetyProblem + ", address=" + address + ", number=" + number
				+ ", registrationTime=" + registrationTime + ", password=" + password + "]";
	}
}