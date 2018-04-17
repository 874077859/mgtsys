package com.vip.mgtsys.model;

import java.io.Serializable;

public class EmployerInfo implements Serializable {

	private static final long serialVersionUID = -8823504831198719837L;
	
	private String sid;
	
	private String employerId;
	
	private String employerPwd;
	
	private String employerName;
	
	private String employerPermission;

	private String employerTel;
	
	private String employerAddress;
	
	private String employerMail;
	
	private String employerStatus;
	
	private String loginStatus;
	
	private String lastLogin;
	
	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getEmployerId() {
		return employerId;
	}

	public void setEmployerId(String employerId) {
		this.employerId = employerId;
	}

	public String getEmployerPwd() {
		return employerPwd;
	}

	public void setEmployerPwd(String employerPwd) {
		this.employerPwd = employerPwd;
	}

	public String getEmployerName() {
		return employerName;
	}

	public void setEmployerName(String employerName) {
		this.employerName = employerName;
	}

	public String getEmployerPermission() {
		return employerPermission;
	}

	public void setEmployerPermission(String employerPermission) {
		this.employerPermission = employerPermission;
	}

	public String getEmployerTel() {
		return employerTel;
	}

	public void setEmployerTel(String employerTel) {
		this.employerTel = employerTel;
	}

	public String getEmployerAddress() {
		return employerAddress;
	}

	public void setEmployerAddress(String employerAddress) {
		this.employerAddress = employerAddress;
	}

	public String getEmployerMail() {
		return employerMail;
	}

	public void setEmployerMail(String employerMail) {
		this.employerMail = employerMail;
	}

	public String getEmployerStatus() {
		return employerStatus;
	}

	public void setEmployerStatus(String employerStatus) {
		this.employerStatus = employerStatus;
	}

	public String getLoginStatus() {
		return loginStatus;
	}

	public void setLoginStatus(String loginStatus) {
		this.loginStatus = loginStatus;
	}

	public String getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}
}
