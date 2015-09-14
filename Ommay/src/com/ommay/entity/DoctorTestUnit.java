package com.ommay.entity;

/*
 * @author devouty
 * Copyright 2015-2015 devouty. All rights reserved.
 */
public class DoctorTestUnit {
	private Integer uidIndent;
	private String name, account, inc, testTime, status, updateTime, operator;

	public DoctorTestUnit() {
		name = "未填写";
		account = "未填写";
		inc = "个体会员";
		testTime = "未填写";
		status = "未填写";
		updateTime = "未填写";
		operator = "未填写";
	}

	public Integer getUidIndent() {
		return uidIndent;
	}

	public void setUidIndent(Integer uidIndent) {
		this.uidIndent = uidIndent;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getInc() {
		return inc;
	}

	public void setInc(String inc) {
		this.inc = inc;
	}

	public String getTestTime() {
		return testTime;
	}

	public void setTestTime(String testTime) {
		this.testTime = testTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}
}
